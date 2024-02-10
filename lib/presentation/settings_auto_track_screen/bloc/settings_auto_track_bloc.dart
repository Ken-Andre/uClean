import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/settings_auto_track_screen/models/settings_auto_track_model.dart';
part 'settings_auto_track_event.dart';
part 'settings_auto_track_state.dart';

/// A bloc that manages the state of a SettingsAutoTrack according to the event that is dispatched to it.
class SettingsAutoTrackBloc
    extends Bloc<SettingsAutoTrackEvent, SettingsAutoTrackState> {
  SettingsAutoTrackBloc(SettingsAutoTrackState initialState)
      : super(initialState) {
    on<SettingsAutoTrackInitialEvent>(_onInitialize);
    on<ChangeSwitchEvent>(_changeSwitch);
  }

  _changeSwitch(
    ChangeSwitchEvent event,
    Emitter<SettingsAutoTrackState> emit,
  ) {
    emit(state.copyWith(isSelectedSwitch: event.value));
  }

  _onInitialize(
    SettingsAutoTrackInitialEvent event,
    Emitter<SettingsAutoTrackState> emit,
  ) async {
    emit(state.copyWith(isSelectedSwitch: false));
  }
}
