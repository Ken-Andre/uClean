import 'package:grouped_list/grouped_list.dart';
import 'models/linedelimiterreport_item_model.dart';
import '../report_page/widgets/linedelimiterreport_item_widget.dart';
import 'models/report_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/report_bloc.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ReportBloc>(
        create: (context) =>
            ReportBloc(ReportState(reportModelObj: ReportModel()))
              ..add(ReportInitialEvent()),
        child: ReportPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray10001,
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillGray,
                child: Column(children: [
                  SizedBox(height: 54.v),
                  _buildTopNavApp(context),
                  SizedBox(height: 13.v),
                  _buildLineDelimiterReport(context)
                ]))));
  }

  /// Section Widget
  Widget _buildTopNavApp(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 8.v),
        decoration: AppDecoration.outlineBlueGray,
        child: Row(children: [
          Text("lbl_all_trips".tr, style: theme.textTheme.bodySmall),
          Padding(
              padding: EdgeInsets.only(left: 26.h),
              child:
                  Text("lbl_january_2024".tr, style: theme.textTheme.bodySmall))
        ]));
  }

  /// Section Widget
  Widget _buildLineDelimiterReport(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.h),
            child: BlocSelector<ReportBloc, ReportState, ReportModel?>(
                selector: (state) => state.reportModelObj,
                builder: (context, reportModelObj) {
                  return GroupedListView<LinedelimiterreportItemModel, String>(
                      shrinkWrap: true,
                      stickyHeaderBackgroundColor: Colors.transparent,
                      elements:
                          reportModelObj?.linedelimiterreportItemList ?? [],
                      groupBy: (element) => element.groupBy!,
                      sort: false,
                      groupSeparatorBuilder: (String value) {
                        return Padding(
                            padding: EdgeInsets.only(top: 9.v, bottom: 4.v),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 6.v, bottom: 7.v),
                                      child: SizedBox(
                                          width: 143.h, child: Divider())),
                                  Text(value,
                                      style: CustomTextStyles
                                          .bodySmallInterGray500
                                          .copyWith(color: appTheme.gray500)),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 6.v, bottom: 7.v),
                                      child: SizedBox(
                                          width: 135.h, child: Divider()))
                                ]));
                      },
                      itemBuilder: (context, model) {
                        return LinedelimiterreportItemWidget(model);
                      },
                      separator: SizedBox(height: 12.v));
                })));
  }
}
