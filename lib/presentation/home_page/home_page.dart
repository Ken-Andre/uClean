import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/trip_service.dart';
import '../../services/step_counter_service.dart';
import '../../services/gamification_service.dart';
import '../../models/trip.dart';
import '../../widgets/trip_card.dart';
import '../../core/app_export.dart';
import 'bloc/home_bloc.dart';
import 'models/home_model.dart';

/// Page d'accueil modernisée avec Material Design 3
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeState(homeModelObj: HomeModel()))
        ..add(HomeInitialEvent()),
      child: const HomePage(),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final TripService _tripService = TripService();
  final StepCounterService _stepCounter = StepCounterService.instance;
  final GamificationService _gamification = GamificationService();
  
  bool _isTrackingEnabled = false;
  int _totalPoints = 0;
  int _stepsToday = 0;
  List<Trip> _unclassifiedTrips = [];
  
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
    _loadSettings();
    _loadData();
  }

  Future<void> _loadSettings() async {
    final prefUtils = PrefUtils();
    await prefUtils.init();

    setState(() {
      // Charge l'état du suivi automatique depuis les préférences
      _isTrackingEnabled = prefUtils.getStepTrackingEnabled();
    });

    // Synchronise l'état réel du service
    if (_isTrackingEnabled && !_stepCounter.isTracking) {
      await _stepCounter.startTracking();
    } else if (!_isTrackingEnabled && _stepCounter.isTracking) {
      await _stepCounter.stopTracking();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    final points = await _gamification.getTotalPoints();
    final steps = _stepCounter.stepsToday;
    final trips = await _tripService.getUnclassifiedTrips();
    
    if (mounted) {
      setState(() {
        _totalPoints = points;
        _stepsToday = steps;
        _unclassifiedTrips = trips;
      });
    }
  }

  Future<void> _toggleTracking() async {
    final prefUtils = PrefUtils();
    await prefUtils.init();

    final newState = !_isTrackingEnabled;

    // Sauvegarde immédiatement dans SharedPreferences
    await prefUtils.setStepTrackingEnabled(newState);

    setState(() {
      _isTrackingEnabled = newState;
    });

    if (_isTrackingEnabled) {
      await _stepCounter.startTracking();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 12),
                Text('Suivi automatique activé'),
              ],
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    } else {
      await _stepCounter.stopTracking();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(Icons.pause_circle, color: Colors.white),
                SizedBox(width: 12),
                Text('Suivi automatique désactivé'),
              ],
            ),
            backgroundColor: Colors.orange,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildModernAppBar(),
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWelcomeHeader(),
                const SizedBox(height: 24),
                _buildTrackingSection(),
                const SizedBox(height: 32),
                _buildUnclassifiedTripsSection(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildModernAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: appTheme.whiteA700,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.person_outline, color: appTheme.gray900),
            onPressed: () {
              NavigatorService.pushNamed(AppRoutes.profileScreen);
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: appTheme.lightGreen200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$_totalPoints',
                  style: TextStyle(
                    color: appTheme.gray900,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.stars, color: appTheme.gray900, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.eco,
                  size: 32,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bonjour !',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Vos déplacements écologiques',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildStatCard(
                icon: Icons.directions_walk,
                label: 'Pas aujourd\'hui',
                value: '$_stepsToday',
                color: Colors.blue,
              ),
              const SizedBox(width: 12),
              _buildStatCard(
                icon: Icons.pending_actions,
                label: 'À classifier',
                value: '${_unclassifiedTrips.length}',
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          children: [
            Icon(icon, size: 24, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _isTrackingEnabled ? Icons.gps_fixed : Icons.gps_off,
                  color: _isTrackingEnabled ? Colors.green : Colors.grey,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Suivi automatique',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _isTrackingEnabled ? Colors.green : Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _isTrackingEnabled
                            ? 'Vos déplacements sont suivis'
                            : 'Suivi désactivé',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: _isTrackingEnabled,
                  onChanged: (value) {
                    _toggleTracking();
                  },
                  activeColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: () {
                NavigatorService.pushNamed(AppRoutes.settingsAutoTrackScreen);
              },
              icon: const Icon(Icons.settings, size: 18),
              label: const Text('Configurer le suivi'),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnclassifiedTripsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Trajets à classifier',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              if (_unclassifiedTrips.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_unclassifiedTrips.length}',
                    style: TextStyle(
                      color: Colors.orange[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
            ],
          ),
                    const SizedBox(height: 8),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _unclassifiedTrips.isEmpty
                          ? Container(
                              key: const ValueKey('empty'),
                              padding: const EdgeInsets.all(32),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.grey[200]!),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    size: 48,
                                    color: Colors.green[400],
                                  ),
                                  const SizedBox(height: 12),
                                  const Text(
                                    'Tout est à jour !',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Aucun trajet à classifier',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              key: const ValueKey('trips'),
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(child: Divider(color: Colors.grey[300])),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: Text(
                                          '← Glisser pour classer →',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Expanded(child: Divider(color: Colors.grey[300])),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ..._unclassifiedTrips.asMap().entries.map((entry) {
                                  final trip = entry.value;
                                  return AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    child: Container(
                                      key: ValueKey(trip.id),
                                      child: TripCard(
                                        trip: trip,
                                        onClassified: _loadData,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                    ),
        ],
      ),
    );
  }
}
