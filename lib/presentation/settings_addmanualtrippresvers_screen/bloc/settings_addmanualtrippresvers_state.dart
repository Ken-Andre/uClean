// ignore_for_file: must_be_immutable

part of 'settings_addmanualtrippresvers_bloc.dart';

/// Represents the state of SettingsAddmanualtrippresvers in the application.
class SettingsAddmanualtrippresversState extends Equatable {
  SettingsAddmanualtrippresversState({
    this.wedJanuary31Controller,
    this.oneThousandTwentyEightController,
    this.kmController,
    this.selectedDropDownValue,
    this.settingsAddmanualtrippresversModelObj,
  });

  TextEditingController? wedJanuary31Controller;

  TextEditingController? oneThousandTwentyEightController;

  TextEditingController? kmController;

  SelectionPopupModel? selectedDropDownValue;

  SettingsAddmanualtrippresversModel? settingsAddmanualtrippresversModelObj;

  @override
  List<Object?> get props => [
        wedJanuary31Controller,
        oneThousandTwentyEightController,
        kmController,
        selectedDropDownValue,
        settingsAddmanualtrippresversModelObj,
      ];

  SettingsAddmanualtrippresversState copyWith({
    TextEditingController? wedJanuary31Controller,
    TextEditingController? oneThousandTwentyEightController,
    TextEditingController? kmController,
    SelectionPopupModel? selectedDropDownValue,
    SettingsAddmanualtrippresversModel? settingsAddmanualtrippresversModelObj,
  }) {
    return SettingsAddmanualtrippresversState(
      wedJanuary31Controller:
          wedJanuary31Controller ?? this.wedJanuary31Controller,
      oneThousandTwentyEightController: oneThousandTwentyEightController ??
          this.oneThousandTwentyEightController,
      kmController: kmController ?? this.kmController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      settingsAddmanualtrippresversModelObj:
          settingsAddmanualtrippresversModelObj ??
              this.settingsAddmanualtrippresversModelObj,
    );
  }
}
