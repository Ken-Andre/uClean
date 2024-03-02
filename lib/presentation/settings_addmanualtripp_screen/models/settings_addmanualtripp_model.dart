// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'settingsaddmanualtripp_item_model.dart';

/// This class defines the variables used in the [settings_addmanualtripp_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SettingsAddmanualtrippModel extends Equatable {
  SettingsAddmanualtrippModel(
      {this.settingsaddmanualtrippItemList = const []}) {}

  List<SettingsaddmanualtrippItemModel> settingsaddmanualtrippItemList;

  SettingsAddmanualtrippModel copyWith(
      {List<SettingsaddmanualtrippItemModel>? settingsaddmanualtrippItemList}) {
    return SettingsAddmanualtrippModel(
      settingsaddmanualtrippItemList:
          settingsaddmanualtrippItemList ?? this.settingsaddmanualtrippItemList,
    );
  }

  @override
  List<Object?> get props => [settingsaddmanualtrippItemList];
}
