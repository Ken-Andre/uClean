import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/settings_contactus_screen/models/settings_contactus_model.dart';
part 'settings_contactus_event.dart';
part 'settings_contactus_state.dart';

/// A bloc that manages the state of a SettingsContactus according to the event that is dispatched to it.
class SettingsContactusBloc
    extends Bloc<SettingsContactusEvent, SettingsContactusState> {
  SettingsContactusBloc(SettingsContactusState initialState)
      : super(initialState) {
    on<SettingsContactusInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SettingsContactusInitialEvent event,
    Emitter<SettingsContactusState> emit,
  ) async {}
}
