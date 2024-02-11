import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/settings_addmanualtrippresvers_screen/models/settings_addmanualtrippresvers_model.dart';
part 'settings_addmanualtrippresvers_event.dart';
part 'settings_addmanualtrippresvers_state.dart';

/// A bloc that manages the state of a SettingsAddmanualtrippresvers according to the event that is dispatched to it.
class SettingsAddmanualtrippresversBloc extends Bloc<
    SettingsAddmanualtrippresversEvent, SettingsAddmanualtrippresversState> {
  SettingsAddmanualtrippresversBloc(
      SettingsAddmanualtrippresversState initialState)
      : super(initialState) {
    on<SettingsAddmanualtrippresversInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SettingsAddmanualtrippresversInitialEvent event,
    Emitter<SettingsAddmanualtrippresversState> emit,
  ) async {
    emit(state.copyWith(kmvalueController: TextEditingController()));
  }
}
