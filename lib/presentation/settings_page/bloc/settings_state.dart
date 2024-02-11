// ignore_for_file: must_be_immutable

part of 'settings_bloc.dart';

/// Represents the state of Settings in the application.
class SettingsState extends Equatable {
  SettingsState({
    this.checkmarkEditTextController,
    this.saveEditTextController,
    this.settingsModelObj,
  });

  TextEditingController? checkmarkEditTextController;

  TextEditingController? saveEditTextController;

  SettingsModel? settingsModelObj;

  @override
  List<Object?> get props => [
        checkmarkEditTextController,
        saveEditTextController,
        settingsModelObj,
      ];
  SettingsState copyWith({
    TextEditingController? checkmarkEditTextController,
    TextEditingController? saveEditTextController,
    SettingsModel? settingsModelObj,
  }) {
    return SettingsState(
      checkmarkEditTextController:
          checkmarkEditTextController ?? this.checkmarkEditTextController,
      saveEditTextController:
          saveEditTextController ?? this.saveEditTextController,
      settingsModelObj: settingsModelObj ?? this.settingsModelObj,
    );
  }
}
