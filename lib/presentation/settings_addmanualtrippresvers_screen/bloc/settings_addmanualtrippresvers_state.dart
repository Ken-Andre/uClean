// ignore_for_file: must_be_immutable

part of 'settings_addmanualtrippresvers_bloc.dart';

/// Represents the state of SettingsAddmanualtrippresvers in the application.
class SettingsAddmanualtrippresversState extends Equatable {
  SettingsAddmanualtrippresversState({
    this.kmController,
    this.settingsAddmanualtrippresversModelObj,
  });

  TextEditingController? kmController;

  SettingsAddmanualtrippresversModel? settingsAddmanualtrippresversModelObj;

  @override
  List<Object?> get props => [
        kmController,
        settingsAddmanualtrippresversModelObj,
      ];

  SettingsAddmanualtrippresversState copyWith({
    TextEditingController? kmController,
    SettingsAddmanualtrippresversModel? settingsAddmanualtrippresversModelObj,
  }) {
    return SettingsAddmanualtrippresversState(
      kmController: kmController ?? this.kmController,
      settingsAddmanualtrippresversModelObj:
          settingsAddmanualtrippresversModelObj ??
              this.settingsAddmanualtrippresversModelObj,
    );
  }
}
