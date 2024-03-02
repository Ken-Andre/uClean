import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/settingspage_page/models/settingspage_model.dart';
part 'settingspage_event.dart';
part 'settingspage_state.dart';

/// A bloc that manages the state of a Settingspage according to the event that is dispatched to it.
class SettingspageBloc extends Bloc<SettingspageEvent, SettingspageState> {
  SettingspageBloc(SettingspageState initialState) : super(initialState) {
    on<SettingspageInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SettingspageInitialEvent event,
    Emitter<SettingspageState> emit,
  ) async {
    emit(state.copyWith(
        checkmarkController: TextEditingController(),
        saveController: TextEditingController(),
        contrastController: TextEditingController(),
        signalController: TextEditingController()));
  }
}
