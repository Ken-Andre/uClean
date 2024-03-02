// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'linedelimiterreport_item_model.dart';

/// This class defines the variables used in the [report_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ReportModel extends Equatable {
  ReportModel({this.linedelimiterreportItemList = const []}) {}

  List<LinedelimiterreportItemModel> linedelimiterreportItemList;

  ReportModel copyWith(
      {List<LinedelimiterreportItemModel>? linedelimiterreportItemList}) {
    return ReportModel(
      linedelimiterreportItemList:
          linedelimiterreportItemList ?? this.linedelimiterreportItemList,
    );
  }

  @override
  List<Object?> get props => [linedelimiterreportItemList];
}
