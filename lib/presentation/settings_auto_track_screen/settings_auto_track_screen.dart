import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/step_counter_service.dart';
import '../../services/wifi_tracking_service.dart';
import '../../core/app_export.dart';
import 'bloc/settings_auto_track_bloc.dart';
import 'models/settings_auto_track_model.dart';

/// Écran de configuration du suivi automatique modernisé
class SettingsAutoTrackScreen extends StatefulWidget {
  const SettingsAutoTrackScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsAutoTrackBloc>(
      create: (context) => SettingsAutoTrackBloc(
        SettingsAutoTrackState(settingsAutoTrackModelObj: SettingsAutoTrackModel()),
      )..add(SettingsAutoTrackInitialEvent()),
      child: const SettingsAutoTrackScreen(),
    );
  }

  @override
  State<SettingsAutoTrackScreen> createState() => _SettingsAutoTrackScreenState();
}

class _SettingsAutoTrackScreenState extends State<SettingsAutoTrackScreen> {
  final StepCounterService _stepCounter = StepCounterService.instance;
  final WifiTrackingService _wifiTracking = WifiTrackingService.instance;
  
  bool _stepTrackingEnabled = false;
  bool _wifiTrackingEnabled = false;
  bool _onlyTrackWithinHours = false;
  
  TimeOfDay _startTime = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _endTime = const TimeOfDay(hour: 18, minute: 0);

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    setState(() {
      _stepTrackingEnabled = _stepCounter.isTracking;
      _wifiTrackingEnabled = _wifiTracking.isTracking;
    });
  }

  Future<void> _toggleStepTracking(bool value) async {
    setState(() {
      _stepTrackingEnabled = value;
    });
    
    if (value) {
      await _stepCounter.startTracking();
      if (mounted) {
        _showSnackBar('Comptage de pas activé', Icons.check_circle, Colors.green);
      }
    } else {
      await _stepCounter.stopTracking();
      if (mounted) {
        _showSnackBar('Comptage de pas désactivé', Icons.pause_circle, Colors.orange);
      }
    }
  }

  Future<void> _toggleWifiTracking(bool value) async {
    setState(() {
      _wifiTrackingEnabled = value;
    });
    
    if (value) {
      await _wifiTracking.startTracking();
      if (mounted) {
        _showSnackBar('Suivi WiFi activé', Icons.check_circle, Colors.green);
      }
    } else {
      await _wifiTracking.stopTracking();
      if (mounted) {
        _showSnackBar('Suivi WiFi désactivé', Icons.pause_circle, Colors.orange);
      }
    }
  }

  void _showSnackBar(String message, IconData icon, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Text(message),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _startTime : _endTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Suivi automatique',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Services de suivi'),
            const SizedBox(height: 16),
            _buildTrackingCard(
              title: 'Comptage de pas',
              subtitle: 'Enregistre automatiquement vos pas quotidiens',
              icon: Icons.directions_walk,
              iconColor: Colors.blue,
              value: _stepTrackingEnabled,
              onChanged: _toggleStepTracking,
            ),
            const SizedBox(height: 12),
            _buildTrackingCard(
              title: 'Détection WiFi',
              subtitle: 'Identifie vos lieux (bureau, domicile)',
              icon: Icons.wifi,
              iconColor: Colors.purple,
              value: _wifiTrackingEnabled,
              onChanged: _toggleWifiTracking,
            ),
            const SizedBox(height: 32),
            _buildSectionTitle('Plages horaires'),
            const SizedBox(height: 16),
            _buildTimeRestrictionCard(),
            const SizedBox(height: 32),
            _buildSectionTitle('Statistiques'),
            const SizedBox(height: 16),
            _buildStatsCard(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildTrackingCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRestrictionCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.schedule, color: Theme.of(context).primaryColor, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Limiter aux heures de travail',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Suivre uniquement pendant certaines heures',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: _onlyTrackWithinHours,
                onChanged: (value) {
                  setState(() {
                    _onlyTrackWithinHours = value;
                  });
                },
                activeColor: Colors.green,
              ),
            ],
          ),
          if (_onlyTrackWithinHours) ...[
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildTimeSelector(
                    label: 'Début',
                    time: _startTime,
                    onTap: () => _selectTime(context, true),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTimeSelector(
                    label: 'Fin',
                    time: _endTime,
                    onTap: () => _selectTime(context, false),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTimeSelector({
    required String label,
    required TimeOfDay time,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time.format(context),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Icon(Icons.access_time, color: Colors.grey[600], size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.analytics, color: Theme.of(context).primaryColor, size: 24),
              const SizedBox(width: 12),
              const Text(
                'Statistiques du suivi',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  label: 'Pas aujourd\'hui',
                  value: _stepCounter.stepsToday.toString(),
                  icon: Icons.directions_walk,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatItem(
                  label: 'WiFi détectés',
                  value: _wifiTracking.getWifiProfiles().length.toString(),
                  icon: Icons.wifi,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required String label,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
