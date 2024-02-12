import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/titleunclasslist_item_model.dart';
import 'package:uclean/presentation/report_page/models/report_model.dart';
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
      titleunclasslistItemList: fillTitleunclasslistItemList(),
    )));
  }

  List<TitleunclasslistItemModel> fillTitleunclasslistItemList() {
    return [
      TitleunclasslistItemModel(text1: "Tuesday, 16  "),
      TitleunclasslistItemModel(text1: "Tuesday, 16  ")
    ];
  }
}
