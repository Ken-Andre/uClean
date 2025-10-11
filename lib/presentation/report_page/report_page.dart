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
            backgroundColor: appTheme.gray10001,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.v),
                      Text("lbl_all_trips".tr,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(height: 8.v),
                      _buildFilterChips(context),
                      SizedBox(height: 24.v),
                      _buildReport(context)
                    ]))));
  }

  /// Filter Chips Section
  Widget _buildFilterChips(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
          decoration: BoxDecoration(
            color: appTheme.whiteA70001,
            borderRadius: BorderRadius.circular(20.h),
            boxShadow: [
              BoxShadow(
                color: appTheme.black900.withValues(alpha: 0.08),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("lbl_january_2024".tr,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(width: 4.h),
              Icon(Icons.arrow_drop_down, size: 20),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildReport(BuildContext context) {
    return Expanded(
        child: BlocSelector<ReportBloc, ReportState, ReportModel?>(
            selector: (state) => state.reportModelObj,
            builder: (context, reportModelObj) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16.v);
                  },
                  itemCount: reportModelObj?.reportItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    ReportItemModel model =
                        reportModelObj?.reportItemList[index] ??
                            ReportItemModel();
                    return ReportItemWidget(model);
                  });
            }));
  }
}
