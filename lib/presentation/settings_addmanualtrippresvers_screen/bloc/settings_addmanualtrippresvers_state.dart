// ignore_for_file: must_be_immutable

part of 'settings_addmanualtrippresvers_bloc.dart';

/// Represents the state of SettingsAddmanualtrippresvers in the application.
class SettingsAddmanualtrippresversState extends Equatable {
  SettingsAddmanualtrippresversState({
    this.kmvalueController,
    this.settingsAddmanualtrippresversModelObj,
  });

  TextEditingController? kmvalueController;

  SettingsAddmanualtrippresversModel? settingsAddmanualtrippresversModelObj;

  @override
  List<Object?> get props => [
        kmvalueController,
        settingsAddmanualtrippresversModelObj,
      ];
  SettingsAddmanualtrippresversState copyWith({
    TextEditingController? kmvalueController,
    SettingsAddmanualtrippresversModel? settingsAddmanualtrippresversModelObj,
  }) {
    return SettingsAddmanualtrippresversState(
      kmvalueController: kmvalueController ?? this.kmvalueController,
      settingsAddmanualtrippresversModelObj:
          settingsAddmanualtrippresversModelObj ??
              this.settingsAddmanualtrippresversModelObj,
    );
  }
}
