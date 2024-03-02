import '../../../core/app_export.dart';

/// This class is used in the [linedelimiterreport_item_widget] screen.
class LinedelimiterreportItemModel {
  LinedelimiterreportItemModel({
    this.groupBy,
    this.id,
  }) {
    groupBy = groupBy ?? "";
    id = id ?? "";
  }

  String? groupBy;

  String? id;
}
