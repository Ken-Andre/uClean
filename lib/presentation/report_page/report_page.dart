import 'widgets/report_item_widget.dart';
import 'models/report_item_model.dart';
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
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillGray,
                child: Column(children: [
                  SizedBox(height: 54.v),
                  _buildSeven(context),
                  SizedBox(height: 15.v),
                  _buildReport(context)
                ]))));
  }

  /// Section Widget
  Widget _buildSeven(BuildContext context) {
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
  Widget _buildReport(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.h),
            child: BlocSelector<ReportBloc, ReportState, ReportModel?>(
                selector: (state) => state.reportModelObj,
                builder: (context, reportModelObj) {
                  return ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 12.v);
                      },
                      itemCount: reportModelObj?.reportItemList.length ?? 0,
                      itemBuilder: (context, index) {
                        ReportItemModel model =
                            reportModelObj?.reportItemList[index] ??
                                ReportItemModel();
                        return ReportItemWidget(model);
                      });
                })));
  }
}
