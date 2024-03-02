// ignore_for_file: must_be_immutable

part of 'settingspage_bloc.dart';

/// Represents the state of Settingspage in the application.
class SettingspageState extends Equatable {
  SettingspageState({
    this.checkmarkController,
    this.saveController,
    this.contrastController,
    this.signalController,
    this.settingspageModelObj,
  });

  TextEditingController? checkmarkController;

  TextEditingController? saveController;

  TextEditingController? contrastController;

  TextEditingController? signalController;

  SettingspageModel? settingspageModelObj;

  @override
  List<Object?> get props => [
        checkmarkController,
        saveController,
        contrastController,
        signalController,
        settingspageModelObj,
      ];

  SettingspageState copyWith({
    TextEditingController? checkmarkController,
    TextEditingController? saveController,
    TextEditingController? contrastController,
    TextEditingController? signalController,
    SettingspageModel? settingspageModelObj,
  }) {
    return SettingspageState(
      checkmarkController: checkmarkController ?? this.checkmarkController,
      saveController: saveController ?? this.saveController,
      contrastController: contrastController ?? this.contrastController,
      signalController: signalController ?? this.signalController,
      settingspageModelObj: settingspageModelObj ?? this.settingspageModelObj,
    );
  }
}
