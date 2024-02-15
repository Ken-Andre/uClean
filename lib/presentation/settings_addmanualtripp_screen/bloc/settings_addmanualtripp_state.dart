// ignore_for_file: must_be_immutable

part of 'settings_addmanualtripp_bloc.dart';

/// Represents the state of SettingsAddmanualtripp in the application.
class SettingsAddmanualtrippState extends Equatable {
  SettingsAddmanualtrippState({this.settingsAddmanualtrippModelObj});

  SettingsAddmanualtrippModel? settingsAddmanualtrippModelObj;

  @override
  List<Object?> get props => [
        settingsAddmanualtrippModelObj,
      ];
  SettingsAddmanualtrippState copyWith(
      {SettingsAddmanualtrippModel? settingsAddmanualtrippModelObj}) {
    return SettingsAddmanualtrippState(
      settingsAddmanualtrippModelObj:
          settingsAddmanualtrippModelObj ?? this.settingsAddmanualtrippModelObj,
    );
  }
}
