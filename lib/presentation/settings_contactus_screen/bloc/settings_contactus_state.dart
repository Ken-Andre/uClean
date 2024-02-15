// ignore_for_file: must_be_immutable

part of 'settings_contactus_bloc.dart';

/// Represents the state of SettingsContactus in the application.
class SettingsContactusState extends Equatable {
  SettingsContactusState({this.settingsContactusModelObj});

  SettingsContactusModel? settingsContactusModelObj;

  @override
  List<Object?> get props => [
        settingsContactusModelObj,
      ];
  SettingsContactusState copyWith(
      {SettingsContactusModel? settingsContactusModelObj}) {
    return SettingsContactusState(
      settingsContactusModelObj:
          settingsContactusModelObj ?? this.settingsContactusModelObj,
    );
  }
}
