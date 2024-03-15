// ignore_for_file: must_be_immutable

part of 'settings_addmanualtripp_bloc.dart';

/// Represents the state of SettingsAddmanualtripp in the application.
class SettingsAddmanualtrippState extends Equatable {
  SettingsAddmanualtrippState({
    this.wedJanuary3Controller,
    this.oneThousandTwentyEightController,
    this.startLocationController,
    this.stopLocationController,
    this.selectedDropDownValue,
    this.settingsAddmanualtrippModelObj,
  });

  TextEditingController? wedJanuary3Controller;

  TextEditingController? oneThousandTwentyEightController;

  TextEditingController? startLocationController;

  TextEditingController? stopLocationController;

  SelectionPopupModel? selectedDropDownValue;

  SettingsAddmanualtrippModel? settingsAddmanualtrippModelObj;

  @override
  List<Object?> get props => [
        wedJanuary3Controller,
        oneThousandTwentyEightController,
        startLocationController,
        stopLocationController,
        selectedDropDownValue,
        settingsAddmanualtrippModelObj,
      ];

  SettingsAddmanualtrippState copyWith({
    TextEditingController? wedJanuary3Controller,
    TextEditingController? oneThousandTwentyEightController,
    TextEditingController? startLocationController,
    TextEditingController? stopLocationController,
    SelectionPopupModel? selectedDropDownValue,
    SettingsAddmanualtrippModel? settingsAddmanualtrippModelObj,
  }) {
    return SettingsAddmanualtrippState(
      wedJanuary3Controller:
          wedJanuary3Controller ?? this.wedJanuary3Controller,
      oneThousandTwentyEightController: oneThousandTwentyEightController ??
          this.oneThousandTwentyEightController,
      startLocationController:
          startLocationController ?? this.startLocationController,
      stopLocationController:
          stopLocationController ?? this.stopLocationController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      settingsAddmanualtrippModelObj:
          settingsAddmanualtrippModelObj ?? this.settingsAddmanualtrippModelObj,
    );
  }
}
