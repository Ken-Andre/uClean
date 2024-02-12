import '../../../core/app_export.dart';

/// This class is used in the [titleunclasslist_item_widget] screen.
class TitleunclasslistItemModel {
  TitleunclasslistItemModel({
    this.text1,
    this.id,
  }) {
    text1 = text1 ?? "Tuesday, 16  ";
    id = id ?? "";
  }

  String? text1;

  String? id;
}
