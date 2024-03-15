// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:ucleankim/core/app_export.dart';
import 'settingsaddmanualtrippresvers_item_model.dart';

/// This class defines the variables used in the [settings_addmanualtrippresvers_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SettingsAddmanualtrippresversModel extends Equatable {
  SettingsAddmanualtrippresversModel({
    this.settingsaddmanualtrippresversItemList = const [],
    this.dropdownItemList = const [],
  }) {}

  List<SettingsaddmanualtrippresversItemModel>
      settingsaddmanualtrippresversItemList;

  List<SelectionPopupModel> dropdownItemList;

  SettingsAddmanualtrippresversModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<SettingsaddmanualtrippresversItemModel>?
        settingsaddmanualtrippresversItemList,
  }) {
    return SettingsAddmanualtrippresversModel(
      settingsaddmanualtrippresversItemList:
          settingsaddmanualtrippresversItemList ??
              this.settingsaddmanualtrippresversItemList,
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
    );
  }

  @override
  List<Object?> get props => [
        settingsaddmanualtrippresversItemList,
        dropdownItemList,
      ];
}
