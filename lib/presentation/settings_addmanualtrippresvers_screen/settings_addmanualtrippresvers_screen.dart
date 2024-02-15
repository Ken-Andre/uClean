import 'bloc/settings_addmanualtrippresvers_bloc.dart';
import 'models/settings_addmanualtrippresvers_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/widgets/app_bar/appbar_leading_image.dart';
import 'package:uclean/widgets/app_bar/appbar_subtitle.dart';
import 'package:uclean/widgets/app_bar/custom_app_bar.dart';
import 'package:uclean/widgets/custom_elevated_button.dart';
import 'package:uclean/widgets/custom_icon_button.dart';
import 'package:uclean/widgets/custom_text_form_field.dart';

class SettingsAddmanualtrippresversScreen extends StatelessWidget {
  const SettingsAddmanualtrippresversScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsAddmanualtrippresversBloc>(
        create: (context) => SettingsAddmanualtrippresversBloc(
            SettingsAddmanualtrippresversState(
                settingsAddmanualtrippresversModelObj:
                    SettingsAddmanualtrippresversModel()))
          ..add(SettingsAddmanualtrippresversInitialEvent()),
        child: SettingsAddmanualtrippresversScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.red50,
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 14.v),
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Column(children: [
                      Text("lbl_detailed".tr,
                          style: CustomTextStyles.bodyMediumRegular),
                      SizedBox(
                          width: 50.h,
                          child: Divider(color: theme.colorScheme.primary))
                    ]),
                    Padding(
                        padding: EdgeInsets.only(left: 7.h),
                        child: Column(children: [
                          Text("lbl_resume".tr,
                              style: CustomTextStyles.bodyMediumRegular),
                          SizedBox(
                              width: 50.h,
                              child: Divider(
                                  color:
                                      theme.colorScheme.onSecondaryContainer))
                        ]))
                  ]),
                  SizedBox(height: 2.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_date_and_hour".tr,
                          style: theme.textTheme.titleSmall)),
                  SizedBox(height: 12.v),
                  _buildFrameEightyTwo(context),
                  SizedBox(height: 2.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("msg_number_of_kilometers".tr,
                          style: theme.textTheme.titleSmall)),
                  SizedBox(height: 12.v),
                  Padding(
                      padding: EdgeInsets.only(left: 10.h, right: 9.h),
                      child: BlocSelector<
                              SettingsAddmanualtrippresversBloc,
                              SettingsAddmanualtrippresversState,
                              TextEditingController?>(
                          selector: (state) => state.kmvalueController,
                          builder: (context, kmvalueController) {
                            return CustomTextFormField(
                                controller: kmvalueController,
                                hintText: "lbl_km".tr,
                                hintStyle: CustomTextStyles.bodyMediumBlack900,
                                textInputAction: TextInputAction.done,
                                suffix: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        8.h, 10.v, 30.h, 10.v),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgMusic,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize)),
                                suffixConstraints:
                                    BoxConstraints(maxHeight: 44.v),
                                borderDecoration:
                                    TextFormFieldStyleHelper.fillPrimary);
                          })),
                  SizedBox(height: 4.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_trip_mode".tr,
                          style: theme.textTheme.titleSmall)),
                  SizedBox(height: 10.v),
                  _buildFrameEightyTwo1(context),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildFrameNinetyFive(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 29.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 23.h, top: 20.v, bottom: 24.v)),
        centerTitle: true,
        title: AppbarSubtitle(text: "msg_add_a_manual_trip".tr));
  }

  /// Section Widget
  Widget _buildFrameEightyTwo(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 9.h),
        padding: EdgeInsets.symmetric(vertical: 5.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 19.h, vertical: 6.v),
                      decoration: AppDecoration.fillPrimary.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  openDatePickerDialog(context);
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgCalendar,
                                          height: 20.v,
                                          width: 18.h,
                                          margin: EdgeInsets.only(bottom: 3.v)),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 9.h, top: 1.v),
                                          child: Text("lbl_wed_january_31".tr,
                                              style:
                                                  theme.textTheme.bodyMedium))
                                    ])),
                            Spacer(),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgClock,
                                      height: 20.adaptSize,
                                      width: 20.adaptSize,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 1.v)),
                                  Padding(
                                      padding: EdgeInsets.only(left: 10.h),
                                      child: Text("lbl_10_28".tr,
                                          style: theme.textTheme.bodyMedium))
                                ])
                          ])))
            ]));
  }

  /// Section Widget
  Widget _buildFrameEightyTwo1(BuildContext context) {
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
                      child: CustomIconButton(
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          decoration: IconButtonStyleHelper.outlineBlackTL3,
                          alignment: Alignment.center,
                          child: CustomImageView(
                              imagePath: ImageConstant.imgMotorcycle))),
                  CustomIconButton(
                      height: 30.v,
                      width: 28.h,
                      child: CustomImageView(imagePath: ImageConstant.imgWalk))
                ])));
  }

  /// Section Widget
  Widget _buildFrameNinetyFive(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 8.v),
        decoration: AppDecoration.outlineGrayF,
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
                addNewTrip(context);
              })
        ]));
  }

  /// Displays a date picker dialog to update the selected date
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> openDatePickerDialog(BuildContext context) async {
    var initialState =
        BlocProvider.of<SettingsAddmanualtrippresversBloc>(context).state;
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }
}
