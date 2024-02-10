import 'bloc/settings_addmanualtripp_bloc.dart';
import 'models/settings_addmanualtripp_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/widgets/app_bar/appbar_leading_image.dart';
import 'package:uclean/widgets/app_bar/appbar_subtitle.dart';
import 'package:uclean/widgets/app_bar/custom_app_bar.dart';
import 'package:uclean/widgets/custom_elevated_button.dart';
import 'package:uclean/widgets/custom_icon_button.dart';

class SettingsAddmanualtrippScreen extends StatelessWidget {
  const SettingsAddmanualtrippScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsAddmanualtrippBloc>(
        create: (context) => SettingsAddmanualtrippBloc(
            SettingsAddmanualtrippState(
                settingsAddmanualtrippModelObj: SettingsAddmanualtrippModel()))
          ..add(SettingsAddmanualtrippInitialEvent()),
        child: SettingsAddmanualtrippScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsAddmanualtrippBloc, SettingsAddmanualtrippState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: appTheme.red50,
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 14.v),
                  child: Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Column(children: [
                        Text("lbl_detailed".tr,
                            style: CustomTextStyles.bodyMediumRegular),
                        SizedBox(
                            width: 50.h,
                            child: Divider(
                                color: theme.colorScheme.onSecondaryContainer))
                      ]),
                      Padding(
                          padding: EdgeInsets.only(left: 7.h),
                          child: Column(children: [
                            Text("lbl_resume".tr,
                                style: CustomTextStyles.bodyMediumRegular),
                            SizedBox(
                                width: 50.h,
                                child:
                                    Divider(color: theme.colorScheme.primary))
                          ]))
                    ]),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("lbl_start_point".tr,
                            style: theme.textTheme.titleSmall)),
                    SizedBox(height: 12.v),
                    _buildFrameEightyTwo2(context),
                    SizedBox(height: 3.v),
                    CustomElevatedButton(
                        height: 42.v,
                        text: "lbl_start_location".tr,
                        margin: EdgeInsets.only(left: 10.h, right: 9.h),
                        leftIcon: Container(
                            margin: EdgeInsets.only(right: 9.h),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgCalendar,
                                height: 20.v,
                                width: 18.h)),
                        buttonStyle: CustomButtonStyles.fillPrimary,
                        buttonTextStyle: CustomTextStyles.bodyMediumBlack900),
                    SizedBox(height: 1.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("lbl_stop_point".tr,
                            style: theme.textTheme.titleSmall)),
                    SizedBox(height: 10.v),
                    _buildFrameEightyTwo4(context),
                    SizedBox(height: 3.v),
                    CustomElevatedButton(
                        height: 42.v,
                        text: "lbl_stop_location".tr,
                        margin: EdgeInsets.only(left: 10.h, right: 9.h),
                        leftIcon: Container(
                            margin: EdgeInsets.only(right: 9.h),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgCalendar,
                                height: 20.v,
                                width: 18.h)),
                        buttonStyle: CustomButtonStyles.fillPrimary,
                        buttonTextStyle: CustomTextStyles.bodyMediumBlack900),
                    SizedBox(height: 1.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("lbl_trip_mode".tr,
                            style: theme.textTheme.titleSmall)),
                    SizedBox(height: 10.v),
                    _buildFrameEightyTwo5(context),
                    SizedBox(height: 5.v)
                  ])),
              bottomNavigationBar: _buildFrameNinetySix(context)));
    });
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
        title: AppbarSubtitle(text: "msg_add_a_manual_trip".tr));
  }

  /// Section Widget
  Widget _buildFrameEightyTwo2(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 9.h),
        padding: EdgeInsets.symmetric(vertical: 5.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildFrameEightyTwo(context,
                  wedJanuaryThirtyOne: "lbl_wed_january_31".tr,
                  timeText: "lbl_10_28".tr)
            ]));
  }

  /// Section Widget
  Widget _buildFrameEightyTwo4(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 9.h),
        padding: EdgeInsets.symmetric(vertical: 5.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: _buildFrameEightyTwo(context,
            wedJanuaryThirtyOne: "lbl_wed_january_31".tr,
            timeText: "lbl_10_28".tr));
  }

  /// Section Widget
  Widget _buildFrameEightyTwo5(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 9.h),
        padding: EdgeInsets.symmetric(vertical: 5.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 94.h, vertical: 5.v),
            decoration:
                BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                      height: 30.adaptSize,
                      width: 30.adaptSize,
                      child: CustomImageView(
                          imagePath: ImageConstant.imgCarBlack900)),
                  CustomIconButton(
                      height: 30.adaptSize,
                      width: 30.adaptSize,
                      decoration: IconButtonStyleHelper.outlineBlackTL3,
                      child:
                          CustomImageView(imagePath: ImageConstant.imgSubway)),
                  Container(
                      height: 30.adaptSize,
                      width: 30.adaptSize,
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgMotorcycle,
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          radius: BorderRadius.circular(3.h),
                          alignment: Alignment.center)),
                  CustomIconButton(
                      height: 30.v,
                      width: 28.h,
                      child: CustomImageView(imagePath: ImageConstant.imgWalk))
                ])));
  }

  /// Section Widget
  Widget _buildFrameNinetySix(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 8.v),
        decoration: AppDecoration.outlineBlack9001,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(bottom: 1.v),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_9999".tr, style: theme.textTheme.titleSmall),
                    Padding(
                        padding: EdgeInsets.only(top: 2.v),
                        child: Text("lbl_kilometers".tr,
                            style: theme.textTheme.bodyMedium))
                  ])),
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("lbl_professional".tr, style: theme.textTheme.titleSmall),
                Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child:
                        Text("lbl_trip".tr, style: theme.textTheme.bodyMedium))
              ]),
          CustomElevatedButton(
              height: 26.v,
              width: 87.h,
              text: "lbl_add_drive".tr,
              margin: EdgeInsets.only(top: 10.v, bottom: 11.v),
              buttonStyle: CustomButtonStyles.outlineBlack,
              buttonTextStyle: CustomTextStyles.bodyMediumPrimary,
              onPressed: () {
                onTapAddDrive(context);
              })
        ]));
  }

  /// Common widget
  Widget _buildFrameEightyTwo(
    BuildContext context, {
    required String wedJanuaryThirtyOne,
    required String timeText,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 6.v),
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgCalendar,
              height: 20.v,
              width: 18.h,
              margin: EdgeInsets.symmetric(vertical: 2.v)),
          Padding(
              padding: EdgeInsets.only(left: 9.h, top: 2.v),
              child: Text(wedJanuaryThirtyOne,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: appTheme.black900))),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgClock,
              height: 20.adaptSize,
              width: 20.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 2.v)),
          Padding(
              padding: EdgeInsets.only(left: 10.h, top: 1.v, right: 2.h),
              child: Text(timeText,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: appTheme.black900)))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapAddDrive(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
