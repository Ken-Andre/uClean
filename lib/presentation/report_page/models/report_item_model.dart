import '../../../core/app_export.dart';

/// This class is used in the [report_item_widget] screen.
class ReportItemModel {
  ReportItemModel({
    this.tripKind,
    this.fromElthamStation,
    this.image,
    this.time,
    this.distance,
    this.id,
  }) {
    tripKind = tripKind ?? "Professionnal";
    fromElthamStation = fromElthamStation ?? ImageConstant.imgMeansoftransport;
    image = image ?? ImageConstant.imgMeansoftransportDeepOrange200;
    time = time ?? "12:15 PM - 1:19 PM";
    distance = distance ?? "2KM";
    id = id ?? "";
  }

  String? tripKind;

  String? fromElthamStation;

  String? image;

  String? time;

  String? distance;

  String? id;
}
