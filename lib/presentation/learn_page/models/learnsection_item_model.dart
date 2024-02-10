import '../../../core/app_export.dart';

/// This class is used in the [learnsection_item_widget] screen.
class LearnsectionItemModel {
  LearnsectionItemModel({
    this.skyImage,
    this.skyText,
    this.id,
  }) {
    skyImage = skyImage ?? ImageConstant.imgAnArtisticAnd;
    skyText = skyText ?? "The beauty of the sky";
    id = id ?? "";
  }

  String? skyImage;

  String? skyText;

  String? id;
}
