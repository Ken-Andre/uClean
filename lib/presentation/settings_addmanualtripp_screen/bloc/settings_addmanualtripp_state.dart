// ignore_for_file: must_be_immutable

part of 'settings_addmanualtripp_bloc.dart';

/// Represents the state of SettingsAddmanualtripp in the application.
class SettingsAddmanualtrippState extends Equatable {
  SettingsAddmanualtrippState({
    this.startLocationController,
    this.stopLocationController,
    this.settingsAddmanualtrippModelObj,
  });

  TextEditingController? startLocationController;

  TextEditingController? stopLocationController;

  SettingsAddmanualtrippModel? settingsAddmanualtrippModelObj;

  @override
  List<Object?> get props => [
        startLocationController,
        stopLocationController,
        settingsAddmanualtrippModelObj,
      ];
  SettingsAddmanualtrippState copyWith({
    TextEditingController? startLocationController,
    TextEditingController? stopLocationController,
    SettingsAddmanualtrippModel? settingsAddmanualtrippModelObj,
  }) {
    return SettingsAddmanualtrippState(
      startLocationController:
          startLocationController ?? this.startLocationController,
      stopLocationController:
          stopLocationController ?? this.stopLocationController,
      settingsAddmanualtrippModelObj:
          settingsAddmanualtrippModelObj ?? this.settingsAddmanualtrippModelObj,
    );
  }
}
