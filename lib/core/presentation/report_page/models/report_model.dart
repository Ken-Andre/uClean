// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'titleunclasslist_item_model.dart';

/// This class defines the variables used in the [report_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ReportModel extends Equatable {
  ReportModel({this.titleunclasslistItemList = const []}) {}

  List<TitleunclasslistItemModel> titleunclasslistItemList;

  ReportModel copyWith(
      {List<TitleunclasslistItemModel>? titleunclasslistItemList}) {
    return ReportModel(
      titleunclasslistItemList:
          titleunclasslistItemList ?? this.titleunclasslistItemList,
    );
  }

  @override
  List<Object?> get props => [titleunclasslistItemList];
}
