// ignore_for_file: must_be_immutable

part of 'settings_auto_track_bloc.dart';

/// Represents the state of SettingsAutoTrack in the application.
class SettingsAutoTrackState extends Equatable {
  SettingsAutoTrackState({
    this.isSelectedSwitch = false,
    this.settingsAutoTrackModelObj,
  });

  SettingsAutoTrackModel? settingsAutoTrackModelObj;

  bool isSelectedSwitch;

  @override
  List<Object?> get props => [
        isSelectedSwitch,
        settingsAutoTrackModelObj,
      ];

  SettingsAutoTrackState copyWith({
    bool? isSelectedSwitch,
    SettingsAutoTrackModel? settingsAutoTrackModelObj,
  }) {
    return SettingsAutoTrackState(
      isSelectedSwitch: isSelectedSwitch ?? this.isSelectedSwitch,
      settingsAutoTrackModelObj:
          settingsAutoTrackModelObj ?? this.settingsAutoTrackModelObj,
    );
  }
}
