// ignore_for_file: must_be_immutable

part of 'settingsautotrack_bloc.dart';

/// Represents the state of Settingsautotrack in the application.
class SettingsautotrackState extends Equatable {
  SettingsautotrackState({
    this.isSelectedSwitch = false,
    this.settingsautotrackModelObj,
  });

  SettingsautotrackModel? settingsautotrackModelObj;

  bool isSelectedSwitch;

  @override
  List<Object?> get props => [
        isSelectedSwitch,
        settingsautotrackModelObj,
      ];
  SettingsautotrackState copyWith({
    bool? isSelectedSwitch,
    SettingsautotrackModel? settingsautotrackModelObj,
  }) {
    return SettingsautotrackState(
      isSelectedSwitch: isSelectedSwitch ?? this.isSelectedSwitch,
      settingsautotrackModelObj:
          settingsautotrackModelObj ?? this.settingsautotrackModelObj,
    );
  }
}
