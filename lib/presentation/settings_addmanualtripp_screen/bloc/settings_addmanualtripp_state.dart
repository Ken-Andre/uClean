// ignore_for_file: must_be_immutable

part of 'settings_addmanualtripp_bloc.dart';

/// Represents the state of SettingsAddmanualtripp in the application.
class SettingsAddmanualtrippState extends Equatable {
  SettingsAddmanualtrippState({
    this.wedJanuaryThirtyOneController,
    this.settingsAddmanualtrippModelObj,
  });

  TextEditingController? wedJanuaryThirtyOneController;

  SettingsAddmanualtrippModel? settingsAddmanualtrippModelObj;

  @override
  List<Object?> get props => [
        wedJanuaryThirtyOneController,
        settingsAddmanualtrippModelObj,
      ];

  SettingsAddmanualtrippState copyWith({
    TextEditingController? wedJanuaryThirtyOneController,
    SettingsAddmanualtrippModel? settingsAddmanualtrippModelObj,
  }) {
    return SettingsAddmanualtrippState(
      wedJanuaryThirtyOneController:
          wedJanuaryThirtyOneController ?? this.wedJanuaryThirtyOneController,
      settingsAddmanualtrippModelObj:
          settingsAddmanualtrippModelObj ?? this.settingsAddmanualtrippModelObj,
    );
  }
}
