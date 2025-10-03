import 'dart:async';
import 'dart:convert';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart'; // Pour formater la date

// TODO: Remplacer l'accès par singleton par une injection de dépendances (Règle #4).

/// Service de comptage de pas en arrière-plan.
class StepCounterService {
  static const String _storageKey = 'step_counter_data';

  // Singleton
  static StepCounterService? _instance;
  static StepCounterService get instance {
    _instance ??= StepCounterService._();
    return _instance!;
  }

  StepCounterService._();

  StreamSubscription<StepCount>? _stepSubscription;
  StreamSubscription<PedestrianStatus>? _statusSubscription;

  bool _isTracking = false;
  int _sessionStartSteps = 0;
  int _lastKnownTotalSteps = 0;
  String _lastResetDay = '';

  final StreamController<int> _stepUpdateController =
      StreamController<int>.broadcast();
  Stream<int> get onStepCountUpdate => _stepUpdateController.stream;

  bool get isTracking => _isTracking;
  int get stepsToday => _lastKnownTotalSteps;

  /// Démarre le comptage de pas.
  Future<void> startTracking() async {
    if (_isTracking) return;

    try {
      await _loadStepData();
      await _resetStepsIfNeeded();

      _stepSubscription = Pedometer.stepCountStream.listen(
        _onStepCount,
        onError: (error) => print('🔴 Erreur Pedometer (Steps): $error'),
      );

      _statusSubscription = Pedometer.pedestrianStatusStream.listen(
        (status) => print('🚶 Statut piéton: ${status.status}'),
        onError: (error) => print('🔴 Erreur Pedometer (Status): $error'),
      );

      _isTracking = true;
      print(
          '✅ Comptage de pas démarré. Pas aujourd\'hui: $_lastKnownTotalSteps');
    } catch (e) {
      print('🔴 Erreur au démarrage du comptage de pas: $e');
    }
  }

  /// Arrête le comptage de pas.
  Future<void> stopTracking() async {
    if (!_isTracking) return;
    _isTracking = false;

    await _stepSubscription?.cancel();
    await _statusSubscription?.cancel();
    await _saveStepData(); // Sauvegarde finale

    print('⏹️ Comptage de pas arrêté.');
  }

  void _onStepCount(StepCount event) {
    if (_sessionStartSteps == 0) {
      _sessionStartSteps = event.steps;
    }

    // Calcule les pas effectués depuis le début de la session de tracking.
    final int stepsSinceStart = event.steps - _sessionStartSteps;
    _lastKnownTotalSteps += stepsSinceStart;
    _sessionStartSteps = event.steps;

    if (!_stepUpdateController.isClosed) {
      _stepUpdateController.add(_lastKnownTotalSteps);
    }

    // Sauvegarde périodique pour ne pas perdre de données
    _saveStepData();
  }

  /// **[CORRIGÉ & SIMPLIFIÉ]** Réinitialise le compteur si c'est un nouveau jour.
  Future<void> _resetStepsIfNeeded() async {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    if (_lastResetDay != today) {
      print('🌞 Nouveau jour ! Réinitialisation du compteur de pas.');
      _lastKnownTotalSteps = 0;
      _sessionStartSteps = 0;
      _lastResetDay = today;
      await _saveStepData();
    }
  }

  Future<Map<String, dynamic>> getStepStats() async {
    await _loadStepData();
    return {
      'steps_today': _lastKnownTotalSteps,
      'is_tracking': _isTracking,
      'last_reset_day': _lastResetDay,
    };
  }

  /// **[CORRIGÉ]** Charge les données depuis le stockage local.
  Future<void> _loadStepData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? data = prefs.getString(_storageKey);

      if (data != null) {
        final Map<String, dynamic> stepData = json.decode(data);
        _lastKnownTotalSteps = stepData['steps_today'] ?? 0;
        _lastResetDay = stepData['last_reset_day'] ?? '';
      }
    } catch (e) {
      print('🔴 Erreur lors du chargement des données de pas: $e');
      _lastKnownTotalSteps = 0;
      _lastResetDay = '';
    }
  }

  /// **[CORRIGÉ]** Sauvegarde les données dans le stockage local.
  Future<void> _saveStepData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final stepData = {
        'steps_today': _lastKnownTotalSteps,
        'last_reset_day': _lastResetDay,
      };
      await prefs.setString(_storageKey, json.encode(stepData));
    } catch (e) {
      print('🔴 Erreur lors de la sauvegarde des données de pas: $e');
    }
  }

  /// Nettoie toutes les données de pas.
  Future<void> reset() async {
    _lastKnownTotalSteps = 0;
    _sessionStartSteps = 0;
    _lastResetDay = DateFormat('yyyy-MM-dd').format(DateTime.now());
    await _saveStepData();
  }

  void dispose() {
    _stepUpdateController.close();
    stopTracking();
  }
}

/// Singleton global.
final stepCounterService = StepCounterService.instance;
