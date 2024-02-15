// ignore_for_file: must_be_immutable

part of 'settings_bloc.dart';

/// Represents the state of Settings in the application.
class SettingsState extends Equatable {
  SettingsState({
    this.checkConfigurationController,
    this.reportingPeriodsController,
    this.settingsModelObj,
  });

  TextEditingController? checkConfigurationController;

  TextEditingController? reportingPeriodsController;

  SettingsModel? settingsModelObj;

  @override
  List<Object?> get props => [
        checkConfigurationController,
        reportingPeriodsController,
        settingsModelObj,
      ];
  SettingsState copyWith({
    TextEditingController? checkConfigurationController,
    TextEditingController? reportingPeriodsController,
    SettingsModel? settingsModelObj,
  }) {
    return SettingsState(
      checkConfigurationController:
          checkConfigurationController ?? this.checkConfigurationController,
      reportingPeriodsController:
          reportingPeriodsController ?? this.reportingPeriodsController,
      settingsModelObj: settingsModelObj ?? this.settingsModelObj,
    );
  }
}
