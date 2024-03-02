import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/settingsaddmanualtripp_item_model.dart';
import 'package:ucleankim/presentation/settings_addmanualtripp_screen/models/settings_addmanualtripp_model.dart';
part 'settings_addmanualtripp_event.dart';
part 'settings_addmanualtripp_state.dart';

/// A bloc that manages the state of a SettingsAddmanualtripp according to the event that is dispatched to it.
class SettingsAddmanualtrippBloc
    extends Bloc<SettingsAddmanualtrippEvent, SettingsAddmanualtrippState> {
  SettingsAddmanualtrippBloc(SettingsAddmanualtrippState initialState)
      : super(initialState) {
    on<SettingsAddmanualtrippInitialEvent>(_onInitialize);
  }

  List<SettingsaddmanualtrippItemModel> fillSettingsaddmanualtrippItemList() {
    return List.generate(1, (index) => SettingsaddmanualtrippItemModel());
  }

  _onInitialize(
    SettingsAddmanualtrippInitialEvent event,
    Emitter<SettingsAddmanualtrippState> emit,
  ) async {
    emit(
        state.copyWith(wedJanuaryThirtyOneController: TextEditingController()));
    emit(state.copyWith(
        settingsAddmanualtrippModelObj: state.settingsAddmanualtrippModelObj
            ?.copyWith(
                settingsaddmanualtrippItemList:
                    fillSettingsaddmanualtrippItemList())));
  }
}
