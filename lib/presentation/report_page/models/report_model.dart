// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
// import '../../../core/app_export.dart';
import 'report_item_model.dart';

/// This class defines the variables used in the [report_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ReportModel extends Equatable {
  ReportModel({this.reportItemList = const []}) {}

  List<ReportItemModel> reportItemList;

  ReportModel copyWith({List<ReportItemModel>? reportItemList}) {
    return ReportModel(
      reportItemList: reportItemList ?? this.reportItemList,
    );
  }

  @override
  List<Object?> get props => [reportItemList];
}
