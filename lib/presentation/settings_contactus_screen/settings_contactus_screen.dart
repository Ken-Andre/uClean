import 'bloc/settings_contactus_bloc.dart';
import 'models/settings_contactus_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/widgets/app_bar/appbar_leading_image.dart';
import 'package:uclean/widgets/app_bar/appbar_subtitle.dart';
import 'package:uclean/widgets/app_bar/custom_app_bar.dart';
import 'package:uclean/widgets/custom_elevated_button.dart';
import 'package:uclean/widgets/custom_outlined_button.dart';

class SettingsContactusScreen extends StatelessWidget {
  const SettingsContactusScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsContactusBloc>(
        create: (context) => SettingsContactusBloc(SettingsContactusState(
            settingsContactusModelObj: SettingsContactusModel()))
          ..add(SettingsContactusInitialEvent()),
        child: SettingsContactusScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsContactusBloc, SettingsContactusState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: appTheme.red50,
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 41.h, vertical: 19.v),
                  child: Column(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgSupporticon,
                        height: 258.adaptSize,
                        width: 258.adaptSize),
                    SizedBox(height: 12.v),
                    Text("lbl_need_some_help".tr,
                        style: CustomTextStyles.headlineSmallPoppins),
                    SizedBox(
                        width: 310.h,
                        child: Text("msg_get_lost_stuck".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.titleLargeBlack900Regular)),
                    SizedBox(height: 6.v),
                    CustomElevatedButton(
                        text: "lbl_contact_us".tr,
                        margin: EdgeInsets.only(left: 34.h, right: 33.h),
                        buttonStyle: CustomButtonStyles.fillCyanTL5,
                        buttonTextStyle: CustomTextStyles.bodyLargeGray10002,
                        onPressed: () {
                          callsupport(context);
                        }),
                    SizedBox(height: 15.v),
                    CustomOutlinedButton(
                        text: "lbl_email_us".tr,
                        margin: EdgeInsets.only(left: 34.h, right: 33.h),
                        onPressed: () {
                          emailsupport(context);
                        }),
                    SizedBox(height: 5.v)
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 29.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 23.h, top: 19.v, bottom: 25.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_contact_support".tr,
            margin: EdgeInsets.only(left: 92.h)));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Opens a URL in the device's default web browser.
  ///
  /// The [context] parameter is the `BuildContext` of the widget that invoked the function.
  ///
  /// Throws an exception if the URL could not be launched.
  callsupport(BuildContext context) async {
    var url = 'https://www.ucac-icam.com/fr/support';
    if (!await launchUrlString(url)) {
      throw 'Could not launch https://www.ucac-icam.com/fr/support';
    }
  }

  /// Opens a URL in the device's default web browser.
  ///
  /// The [context] parameter is the `BuildContext` of the widget that invoked the function.
  ///
  /// Throws an exception if the URL could not be launched.
  emailsupport(BuildContext context) async {
    var url = 'mailto:karol.ngueyap@2026.ucac-icam.com';
    if (!await launchUrlString(url)) {
      throw 'Could not launch mailto:karol.ngueyap@2026.ucac-icam.com';
    }
  }
}
