import 'package:ucleankim/widgets/app_bar/custom_app_bar.dart';
import 'package:ucleankim/widgets/app_bar/appbar_leading_image.dart';
import 'package:ucleankim/widgets/app_bar/appbar_subtitle.dart';
import 'package:ucleankim/widgets/custom_text_form_field.dart';
import 'package:ucleankim/widgets/custom_elevated_button.dart';
import 'widgets/settingsaddmanualtripp_item_widget.dart';
import 'models/settingsaddmanualtripp_item_model.dart';
import 'models/settings_addmanualtripp_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/settings_addmanualtripp_bloc.dart';

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
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray10001,
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 14.v),
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Column(children: [
                      Text("lbl_detailed".tr,
                          style: CustomTextStyles.bodyMediumBlack900),
                      SizedBox(
                          width: 50.h,
                          child: Divider(
                              color: theme.colorScheme.onSecondaryContainer
                                  .withOpacity(1)))
                    ]),
                    Padding(
                        padding: EdgeInsets.only(left: 7.h),
                        child: Column(children: [
                          GestureDetector(
                              onTap: () {
                                onTapTxtResume(context);
                              },
                              child: Text("lbl_resume".tr,
                                  style: CustomTextStyles.bodyMediumBlack900)),
                          SizedBox(
                              width: 50.h,
                              child: Divider(color: appTheme.whiteA70001))
                        ]))
                  ]),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_start_point".tr,
                          style: theme.textTheme.titleSmall)),
                  SizedBox(height: 12.v),
                  _buildFrameEightyTwo(context),
                  SizedBox(height: 3.v),
                  CustomElevatedButton(
                      height: 42.v,
                      text: "lbl_start_location".tr,
                      margin: EdgeInsets.symmetric(horizontal: 10.h),
                      leftIcon: Container(
                          margin: EdgeInsets.only(right: 9.h),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgCalendar,
                              height: 20.v,
                              width: 18.h)),
                      buttonStyle: CustomButtonStyles.fillWhiteA,
                      buttonTextStyle:
                          CustomTextStyles.bodyMediumBlack900Light_1),
                  SizedBox(height: 1.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_stop_point".tr,
                          style: theme.textTheme.titleSmall)),
                  SizedBox(height: 10.v),
                  _buildFrameEightyTwo1(context),
                  SizedBox(height: 3.v),
                  _buildFrameEightyTwo2(context),
                  SizedBox(height: 1.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_trip_mode".tr,
                          style: theme.textTheme.titleSmall)),
                  SizedBox(height: 10.v),
                  _buildSettingsAddManualTripP(context)
                ])),
            bottomNavigationBar: _buildFrameNinetySix(context)));
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
  Widget _buildFrameEightyTwo(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        padding: EdgeInsets.symmetric(vertical: 5.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Container(
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
                  child: BlocSelector<SettingsAddmanualtrippBloc,
                          SettingsAddmanualtrippState, TextEditingController?>(
                      selector: (state) => state.wedJanuaryThirtyOneController,
                      builder: (context, wedJanuaryThirtyOneController) {
                        return CustomTextFormField(
                            controller: wedJanuaryThirtyOneController,
                            hintText: "lbl_wed_january_31".tr,
                            hintStyle: CustomTextStyles.bodyMediumWhiteA70001,
                            textInputAction: TextInputAction.done);
                      })),
              Spacer(),
              CustomImageView(
                  imagePath: ImageConstant.imgClock,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 2.v)),
              GestureDetector(
                  onTap: () {
                    openTimePickerDialogStart(context);
                  },
                  child: Padding(
                      padding:
                          EdgeInsets.only(left: 10.h, top: 1.v, right: 2.h),
                      child: Text("lbl_10_28".tr,
                          style: CustomTextStyles.bodyMediumBlack900Light_2)))
            ])));
  }

  /// Section Widget
  Widget _buildFrameEightyTwo1(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        padding: EdgeInsets.symmetric(vertical: 5.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 6.v),
            decoration:
                BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder5),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgCalendar,
                  height: 20.v,
                  width: 18.h,
                  margin: EdgeInsets.symmetric(vertical: 2.v)),
              GestureDetector(
                  onTap: () {
                    openDatePickerDialogStop(context);
                  },
                  child: Padding(
                      padding: EdgeInsets.only(left: 9.h, top: 2.v),
                      child: Text("lbl_wed_january_31".tr,
                          style: CustomTextStyles.bodyMediumBlack900Light_2))),
              Spacer(),
              CustomImageView(
                  imagePath: ImageConstant.imgClock,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 2.v)),
              GestureDetector(
                  onTap: () {
                    onTapTxtTime(context);
                  },
                  child: Padding(
                      padding:
                          EdgeInsets.only(left: 10.h, top: 1.v, right: 2.h),
                      child: Text("lbl_10_28".tr,
                          style: CustomTextStyles.bodyMediumBlack900Light_2)))
            ])));
  }

  /// Section Widget
  Widget _buildFrameEightyTwo2(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        padding: EdgeInsets.symmetric(vertical: 5.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 105.h, vertical: 3.v),
                      decoration: AppDecoration.fillWhiteA.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgCalendar,
                                height: 20.v,
                                width: 18.h,
                                margin: EdgeInsets.symmetric(vertical: 2.v)),
                            Padding(
                                padding: EdgeInsets.only(top: 2.v),
                                child: Text("lbl_stop_location".tr,
                                    style: CustomTextStyles
                                        .bodyMediumBlack900Light_1))
                          ])))
            ]));
  }

  /// Section Widget
  Widget _buildSettingsAddManualTripP(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        padding: EdgeInsets.symmetric(vertical: 5.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: BlocSelector<SettingsAddmanualtrippBloc,
                SettingsAddmanualtrippState, SettingsAddmanualtrippModel?>(
            selector: (state) => state.settingsAddmanualtrippModelObj,
            builder: (context, settingsAddmanualtrippModelObj) {
              return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 1.v);
                  },
                  itemCount: settingsAddmanualtrippModelObj
                          ?.settingsaddmanualtrippItemList.length ??
                      0,
                  itemBuilder: (context, index) {
                    SettingsaddmanualtrippItemModel model =
                        settingsAddmanualtrippModelObj
                                ?.settingsaddmanualtrippItemList[index] ??
                            SettingsaddmanualtrippItemModel();
                    return SettingsaddmanualtrippItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildFrameNinetySix(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 8.v),
        decoration: AppDecoration.outlineGray5003f,
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
                            style: CustomTextStyles.bodyMediumBlack900Light_2))
                  ])),
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("lbl_professional".tr, style: theme.textTheme.titleSmall),
                Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Text("lbl_trip".tr,
                        style: CustomTextStyles.bodyMediumBlack900Light_2))
              ]),
          CustomElevatedButton(
              height: 26.v,
              width: 87.h,
              text: "lbl_add_drive".tr,
              margin: EdgeInsets.only(top: 10.v, bottom: 11.v),
              buttonStyle: CustomButtonStyles.outlineBlack,
              buttonTextStyle: CustomTextStyles.bodyMediumWhiteA70001,
              onPressed: () {
                onTapAddDrive(context);
              })
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the settingsAddmanualtrippresversScreen when the action is triggered.
  onTapTxtResume(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsAddmanualtrippresversScreen,
    );
  }

  /// Displays a time picker dialog to update the selected time
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> openTimePickerDialogStart(BuildContext context) async {
    var initialState =
        BlocProvider.of<SettingsAddmanualtrippBloc>(context).state;
    TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  /// Displays a date picker dialog to update the selected date
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> openDatePickerDialogStop(BuildContext context) async {
    var initialState =
        BlocProvider.of<SettingsAddmanualtrippBloc>(context).state;
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  /// Displays a time picker dialog to update the selected time
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTxtTime(BuildContext context) async {
    var initialState =
        BlocProvider.of<SettingsAddmanualtrippBloc>(context).state;
    TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  /// Navigates to the homeScreen when the action is triggered.
  onTapAddDrive(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }
}
