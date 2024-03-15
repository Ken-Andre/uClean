// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:ucleankim/data/models/selectionPopupModel/selection_popup_model.dart';
import 'settingsaddmanualtripp_item_model.dart';

/// This class defines the variables used in the [settings_addmanualtripp_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SettingsAddmanualtrippModel extends Equatable {
  SettingsAddmanualtrippModel({
    this.settingsaddmanualtrippItemList = const [],
    this.dropdownItemList = const [],
  }) {}

  List<SettingsaddmanualtrippItemModel> settingsaddmanualtrippItemList;
  List<SelectionPopupModel> dropdownItemList;

  SettingsAddmanualtrippModel copyWith({
    List<SettingsaddmanualtrippItemModel>? settingsaddmanualtrippItemList,
    List<SelectionPopupModel>? dropdownItemList,
  }) {
    return SettingsAddmanualtrippModel(
      settingsaddmanualtrippItemList:
          settingsaddmanualtrippItemList ?? this.settingsaddmanualtrippItemList,
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
    );
  }

  @override
  List<Object?> get props => [
        settingsaddmanualtrippItemList,
        dropdownItemList,
      ];
}
