import '../../../core/app_export.dart';

/// This class is used in the [learncontainer_item_widget] screen.
class LearncontainerItemModel {
  LearncontainerItemModel({
    this.image,
    this.theBeautyOfThe,
    this.id,
  }) {
    image = image ?? ImageConstant.imgAnArtisticAnd;
    theBeautyOfThe = theBeautyOfThe ?? "The beauty of the sky";
    id = id ?? "";
  }

  String? image;

  String? theBeautyOfThe;

  String? id;
}
