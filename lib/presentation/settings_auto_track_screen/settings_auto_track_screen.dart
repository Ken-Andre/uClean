import 'package:ucleankim/widgets/app_bar/custom_app_bar.dart';
import 'package:ucleankim/widgets/app_bar/appbar_leading_image.dart';
import 'package:ucleankim/widgets/app_bar/appbar_subtitle.dart';
import 'package:ucleankim/widgets/custom_switch.dart';
import 'package:ucleankim/widgets/custom_outlined_button.dart';
import 'models/settings_auto_track_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/settings_auto_track_bloc.dart';

class SettingsAutoTrackScreen extends StatelessWidget {
  const SettingsAutoTrackScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsAutoTrackBloc>(
        create: (context) => SettingsAutoTrackBloc(SettingsAutoTrackState(
            settingsAutoTrackModelObj: SettingsAutoTrackModel()))
          ..add(SettingsAutoTrackInitialEvent()),
        child: SettingsAutoTrackScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray10001,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 1.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_tracking_times".tr,
                          style: theme.textTheme.titleSmall)),
                  SizedBox(height: 3.v),
                  _buildFrameEightyOne(context),
                  SizedBox(height: 3.v),
                  _buildFrameEightyTwo(context),
                  SizedBox(height: 6.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 4.h),
                          child: Text("lbl_tracking_times".tr,
                              style: theme.textTheme.titleSmall))),
                  SizedBox(height: 3.v),
                  _buildFrameEightyOne1(context),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 29.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 23.h, top: 20.v, bottom: 24.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_auto_tracking".tr));
  }

  /// Section Widget
  Widget _buildFrameEightyOne(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 9.h),
        padding: EdgeInsets.symmetric(horizontal: 42.h, vertical: 6.v),
        decoration: AppDecoration.outlineBlack9002
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 4.v),
              child: Text("msg_only_track_within".tr,
                  style: CustomTextStyles.bodyMediumBlack900Light_2)),
          BlocSelector<SettingsAutoTrackBloc, SettingsAutoTrackState, bool?>(
              selector: (state) => state.isSelectedSwitch,
              builder: (context, isSelectedSwitch) {
                return CustomSwitch(
                    margin: EdgeInsets.only(top: 1.v),
                    value: isSelectedSwitch,
                    onChange: (value) {
                      context
                          .read<SettingsAutoTrackBloc>()
                          .add(ChangeSwitchEvent(value: value));
                    });
              })
        ]));
  }

  /// Section Widget
  Widget _buildFrameEightyTwo(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 9.h),
        padding: EdgeInsets.symmetric(horizontal: 43.h, vertical: 2.v),
        decoration: AppDecoration.outlineBlack9002
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 6.v, bottom: 5.v),
              child: Text("lbl_schedule".tr,
                  style: CustomTextStyles.bodyMediumBlack900Light_2)),
          CustomImageView(
              imagePath: ImageConstant.imgSaveBlack900,
              height: 33.adaptSize,
              width: 33.adaptSize)
        ]));
  }

  /// Section Widget
  Widget _buildFrameEightyOne1(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 14.h, right: 4.h),
        padding: EdgeInsets.all(2.h),
        decoration: AppDecoration.outlineBlack9003
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Container(
            decoration: AppDecoration.outlineGray
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              _buildRow(context,
                  cell: "lbl_day".tr,
                  cell1: "lbl_start_hour".tr,
                  cell2: "lbl_end_hour".tr),
              _buildRow(context,
                  cell: "lbl_monday".tr, cell1: "lbl2".tr, cell2: "lbl2".tr),
              _buildRow(context,
                  cell: "lbl_tuesday".tr, cell1: "lbl2".tr, cell2: "lbl2".tr),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomOutlinedButton(width: 110.h, text: "lbl_wednesday".tr),
                Container(
                    width: 110.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.v),
                    decoration: AppDecoration.outlineGray4001,
                    child: Text("lbl2".tr,
                        style: CustomTextStyles.bodyMediumBlack900_1)),
                Container(
                    width: 110.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.v),
                    decoration: AppDecoration.outlineGray4001,
                    child: Text("lbl2".tr,
                        style: CustomTextStyles.bodyMediumBlack900_1))
              ]),
              _buildRow(context,
                  cell: "lbl_thursday".tr, cell1: "lbl2".tr, cell2: "lbl2".tr),
              _buildRow(context,
                  cell: "lbl_friday".tr, cell1: "lbl2".tr, cell2: "lbl2".tr),
              _buildRow(context,
                  cell: "lbl_saturday".tr, cell1: "lbl2".tr, cell2: "lbl2".tr),
              _buildRow(context,
                  cell: "lbl_sunday".tr, cell1: "lbl2".tr, cell2: "lbl2".tr)
            ])));
  }

  /// Common widget
  Widget _buildRow(
    BuildContext context, {
    required String cell,
    required String cell1,
    required String cell2,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          width: 110.h,
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.v),
          decoration: AppDecoration.outlineGray4001,
          child: Text(cell,
              style: CustomTextStyles.bodyMediumBlack900_2
                  .copyWith(color: appTheme.black900))),
      Container(
          width: 110.h,
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.v),
          decoration: AppDecoration.outlineGray4001,
          child: Text(cell1,
              style: CustomTextStyles.bodyMediumBlack900_1
                  .copyWith(color: appTheme.black900.withOpacity(0.45)))),
      Container(
          width: 110.h,
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.v),
          decoration: AppDecoration.outlineGray4001,
          child: Text(cell2,
              style: CustomTextStyles.bodyMediumBlack900_1
                  .copyWith(color: appTheme.black900.withOpacity(0.45))))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
