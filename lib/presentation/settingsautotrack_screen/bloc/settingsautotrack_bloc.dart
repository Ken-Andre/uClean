import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/settingsautotrack_screen/models/settingsautotrack_model.dart';
part 'settingsautotrack_event.dart';
part 'settingsautotrack_state.dart';

/// A bloc that manages the state of a Settingsautotrack according to the event that is dispatched to it.
class SettingsautotrackBloc
    extends Bloc<SettingsautotrackEvent, SettingsautotrackState> {
  SettingsautotrackBloc(SettingsautotrackState initialState)
      : super(initialState) {
    on<SettingsautotrackInitialEvent>(_onInitialize);
    on<ChangeSwitchEvent>(_changeSwitch);
  }

  _changeSwitch(
    ChangeSwitchEvent event,
    Emitter<SettingsautotrackState> emit,
  ) {
    emit(state.copyWith(isSelectedSwitch: event.value));
  }

  _onInitialize(
    SettingsautotrackInitialEvent event,
    Emitter<SettingsautotrackState> emit,
  ) async {
    emit(state.copyWith(isSelectedSwitch: false));
  }
}
