import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/linedelimiterreport_item_model.dart';
import 'package:ucleankim/presentation/report_page/models/report_model.dart';
part 'report_event.dart';
part 'report_state.dart';

/// A bloc that manages the state of a Report according to the event that is dispatched to it.
class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc(ReportState initialState) : super(initialState) {
    on<ReportInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ReportInitialEvent event,
    Emitter<ReportState> emit,
  ) async {
    emit(state.copyWith(
        reportModelObj: state.reportModelObj?.copyWith(
            linedelimiterreportItemList:
                fillLinedelimiterreportItemList()))); // TODO: implement Actions
    NavigatorService.pushNamed(
      AppRoutes.settingspagePage,
    );
  }

  List<LinedelimiterreportItemModel> fillLinedelimiterreportItemList() {
    return [
      LinedelimiterreportItemModel(groupBy: "Tuesday, 16  "),
      LinedelimiterreportItemModel(groupBy: "Tuesday, 16  "),
      LinedelimiterreportItemModel(groupBy: "Tuesday, 16  "),
      LinedelimiterreportItemModel(groupBy: "Tuesday, 16  ")
    ];
  }
}
