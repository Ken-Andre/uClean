import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'step_counter_service.dart';
import 'wifi_tracking_service.dart';
import 'notification_service.dart';

// --- Événements du Bloc ---
abstract class TrackingEvent extends Equatable {
  const TrackingEvent();
  @override
  List<Object> get props => [];
}

class StartTracking extends TrackingEvent {}

class StopTracking extends TrackingEvent {}

class _LocationUpdated extends TrackingEvent {
  final LocationClassification location;
  const _LocationUpdated(this.location);
  @override
  List<Object> get props => [location];
}

class _StepsUpdated extends TrackingEvent {
  final int steps;
  const _StepsUpdated(this.steps);
  @override
  List<Object> get props => [steps];
}

// --- États du Bloc ---
class TrackingState extends Equatable {
  final bool isTracking;
  final int stepsToday;
  final LocationClassification currentLocation;

  TrackingState({
    this.isTracking = false,
    this.stepsToday = 0,
    LocationClassification? currentLocation,
  }) : currentLocation = currentLocation ?? LocationClassification.unknown();

  TrackingState copyWith({
    bool? isTracking,
    int? stepsToday,
    LocationClassification? currentLocation,
  }) {
    return TrackingState(
      isTracking: isTracking ?? this.isTracking,
      stepsToday: stepsToday ?? this.stepsToday,
      currentLocation: currentLocation ?? this.currentLocation,
    );
  }

  @override
  List<Object?> get props => [isTracking, stepsToday, currentLocation];
}

/// [BLOC] Contrôleur central pour orchestrer la logique de tracking.
class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  final StepCounterService _stepCounter;
  final WifiTrackingService _wifiTracking;
  final NotificationService _notificationService;

  StreamSubscription? _stepSubscription;
  Timer? _wifiRefreshTimer;

  TrackingBloc({
    required this.isTracking,
    required StepCounterService stepCounter,
    required WifiTrackingService wifiTracking,
    required NotificationService notificationService,
  })  : _stepCounter = stepCounter,
        _wifiTracking = wifiTracking,
        _notificationService = notificationService,
        super(TrackingState()) {
    on<StartTracking>(_onStartTracking);
    on<StopTracking>(_onStopTracking);
    on<_StepsUpdated>(_onStepsUpdated);
    on<_LocationUpdated>(_onLocationUpdated);
  }

  final bool isTracking;

  Future<void> _onStartTracking(
      StartTracking event, Emitter<TrackingState> emit) async {
    if (state.isTracking) return;

    try {
      await _stepCounter.startTracking();
      await _wifiTracking.startTracking();

      _stepSubscription = _stepCounter.onStepCountUpdate.listen((steps) {
        add(_StepsUpdated(steps));
      });

      _wifiRefreshTimer = Timer.periodic(const Duration(minutes: 1), (_) async {
        add(_LocationUpdated(
            await _wifiTracking.getCurrentLocationClassification()));
      });

      final initialSteps = _stepCounter.stepsToday;
      final initialLocation =
          await _wifiTracking.getCurrentLocationClassification();

      emit(state.copyWith(
        isTracking: true,
        stepsToday: initialSteps,
        currentLocation: initialLocation,
      ));

      await _notificationService.showTrackingStatusNotification(true);
      print('✅ TrackingBloc démarré');
    } catch (e) {
      print('🔴 Erreur au démarrage du TrackingBloc: $e');
      emit(state.copyWith(isTracking: false));
    }
  }

  Future<void> _onStopTracking(
      StopTracking event, Emitter<TrackingState> emit) async {
    if (!state.isTracking) return;

    try {
      await _stepCounter.stopTracking();
      await _wifiTracking.stopTracking();
      _stepSubscription?.cancel();
      _wifiRefreshTimer?.cancel();

      await _notificationService.showTrackingStatusNotification(false);
      emit(state.copyWith(isTracking: false));
      print('⏹️ TrackingBloc arrêté');
    } catch (e) {
      print('🔴 Erreur à l\'arrêt du TrackingBloc: $e');
    }
  }

  void _onStepsUpdated(_StepsUpdated event, Emitter<TrackingState> emit) {
    emit(state.copyWith(stepsToday: event.steps));
  }

  void _onLocationUpdated(_LocationUpdated event, Emitter<TrackingState> emit) {
    emit(state.copyWith(currentLocation: event.location));
  }

  @override
  Future<void> close() {
    _stepSubscription?.cancel();
    _wifiRefreshTimer?.cancel();
    return super.close();
  }
}
