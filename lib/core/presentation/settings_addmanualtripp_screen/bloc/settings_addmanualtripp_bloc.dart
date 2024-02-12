import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/settings_addmanualtripp_screen/models/settings_addmanualtripp_model.dart';
part 'settings_addmanualtripp_event.dart';
part 'settings_addmanualtripp_state.dart';

/// A bloc that manages the state of a SettingsAddmanualtripp according to the event that is dispatched to it.
class SettingsAddmanualtrippBloc
    extends Bloc<SettingsAddmanualtrippEvent, SettingsAddmanualtrippState> {
  SettingsAddmanualtrippBloc(SettingsAddmanualtrippState initialState)
      : super(initialState) {
    on<SettingsAddmanualtrippInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SettingsAddmanualtrippInitialEvent event,
    Emitter<SettingsAddmanualtrippState> emit,
  ) async {
    emit(state.copyWith(
        startLocationController: TextEditingController(),
        stopLocationController: TextEditingController()));
  }
}
