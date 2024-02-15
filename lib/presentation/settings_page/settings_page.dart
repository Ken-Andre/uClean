import 'bloc/settings_bloc.dart';
import 'models/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/widgets/custom_elevated_button.dart';
import 'package:uclean/widgets/custom_text_form_field.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsBloc>(
        create: (context) =>
            SettingsBloc(SettingsState(settingsModelObj: SettingsModel()))
              ..add(SettingsInitialEvent()),
        child: SettingsPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.red50,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillRed,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 50.v),
                    child: Column(children: [
                      _buildSettingsButton(context),
                      SizedBox(height: 8.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 20.h),
                              child: Text("lbl_tracking".tr,
                                  style: theme.textTheme.titleSmall))),
                      SizedBox(height: 3.v),
                      _buildCheckConfiguration(context),
                      SizedBox(height: 11.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 18.h),
                              child: Text("lbl_reporting".tr,
                                  style: theme.textTheme.titleSmall))),
                      SizedBox(height: 3.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9.h),
                          child: _buildHelpCenterRow(context,
                              helpCenterText: "lbl_worplaces".tr)),
                      SizedBox(height: 3.v),
                      _buildReportingPeriods(context),
                      SizedBox(height: 10.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 18.h),
                              child: Text("lbl_account".tr,
                                  style: theme.textTheme.titleSmall))),
                      SizedBox(height: 4.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9.h),
                          child: _buildNotificationsRow(context,
                              userImage: ImageConstant.imgLock,
                              notifications: "lbl_your_account".tr,
                              onTapNotificationsRow: () {
                            viewprofileaccount(context);
                          })),
                      SizedBox(height: 3.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9.h),
                          child: _buildNotificationsRow(context,
                              userImage: ImageConstant.imgGroup,
                              notifications: "lbl_notifications".tr,
                              onTapNotificationsRow: () {
                            onTapNotificationsRow(context);
                          })),
                      SizedBox(height: 3.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9.h),
                          child: _buildNotificationsRow(context,
                              userImage: ImageConstant.imgSave,
                              notifications: "lbl_teams".tr)),
                      SizedBox(height: 11.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 20.h),
                              child: Text("lbl_support".tr,
                                  style: theme.textTheme.titleSmall))),
                      SizedBox(height: 3.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.h),
                          child: _buildHelpCenterRow(context,
                              helpCenterText: "lbl_help_center".tr,
                              navigatetohelpcenter: () {
                            navigatetohelpcenter(context);
                          })),
                      SizedBox(height: 11.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 20.h),
                              child: Text("lbl_our_app".tr,
                                  style: theme.textTheme.titleSmall))),
                      SizedBox(height: 3.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.h),
                          child: _buildHelpCenterRow(context,
                              helpCenterText: "lbl_rank_our_app".tr,
                              navigatetohelpcenter: () {
                            onTapHelpCenterRow(context);
                          })),
                      SizedBox(height: 10.v),
                      _buildLogoutButton(context),
                      SizedBox(height: 11.v),
                      Opacity(
                          opacity: 0.7,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgInbox,
                                    height: 16.adaptSize,
                                    width: 16.adaptSize,
                                    margin:
                                        EdgeInsets.only(top: 2.v, bottom: 5.v)),
                                Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Text("lbl_uclean_2024".tr,
                                        style: theme.textTheme.bodyLarge))
                              ])),
                      SizedBox(height: 22.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildSettingsButton(BuildContext context) {
    return CustomElevatedButton(
        height: 46.v,
        text: "lbl_settings".tr,
        buttonStyle: CustomButtonStyles.outlineBlack1,
        buttonTextStyle: CustomTextStyles.titleLargeBlack900);
  }

  /// Section Widget
  Widget _buildCheckConfiguration(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 9.h, right: 7.h),
        child:
            BlocSelector<SettingsBloc, SettingsState, TextEditingController?>(
                selector: (state) => state.checkConfigurationController,
                builder: (context, checkConfigurationController) {
                  return CustomTextFormField(
                      controller: checkConfigurationController,
                      hintText: "msg_check_configuration".tr,
                      hintStyle: theme.textTheme.bodyMedium!,
                      alignment: Alignment.centerLeft,
                      prefix: Container(
                          margin: EdgeInsets.fromLTRB(14.h, 9.v, 18.h, 7.v),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgCheckmark,
                              height: 24.adaptSize,
                              width: 24.adaptSize)),
                      prefixConstraints: BoxConstraints(maxHeight: 40.v),
                      contentPadding: EdgeInsets.only(top: 11.v, bottom: 7.v),
                      borderDecoration: TextFormFieldStyleHelper.outlineBlack);
                }));
  }

  /// Section Widget
  Widget _buildReportingPeriods(BuildContext context) {
    return Container(
        width: 375.h,
        margin: EdgeInsets.symmetric(horizontal: 9.h),
        child:
            BlocSelector<SettingsBloc, SettingsState, TextEditingController?>(
                selector: (state) => state.reportingPeriodsController,
                builder: (context, reportingPeriodsController) {
                  return TextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: reportingPeriodsController,
                      style: theme.textTheme.bodyMedium!,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          hintText: "msg_reporting_periods".tr,
                          hintStyle: theme.textTheme.bodyMedium!,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.h),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.h),
                              borderSide: BorderSide.none),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.h),
                              borderSide: BorderSide.none),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.h),
                              borderSide: BorderSide.none),
                          prefixIcon: Container(
                              margin: EdgeInsets.fromLTRB(9.h, 8.v, 22.h, 8.v),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgSave,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize)),
                          prefixIconConstraints:
                              BoxConstraints(maxHeight: 40.v),
                          filled: true,
                          fillColor: theme.colorScheme.primary,
                          isDense: true,
                          contentPadding:
                              EdgeInsets.only(top: 10.v, bottom: 8.v)),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgSave,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          margin: EdgeInsets.fromLTRB(9.h, 8.v, 22.h, 8.v),
                          child: Text("msg_reporting_periods".tr,
                              style: TextStyle(
                                  color: appTheme.black900,
                                  fontSize: 14.352943420410156.fSize,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300))));
                }));
  }

  /// Section Widget
  Widget _buildLogoutButton(BuildContext context) {
    return Opacity(
        opacity: 0.67,
        child: CustomElevatedButton(
            width: 185.h,
            text: "lbl_log_out".tr,
            buttonStyle: CustomButtonStyles.fillYellow,
            buttonTextStyle: CustomTextStyles.bodyLargeOrange700,
            onPressed: () {
              logoutuser(context);
            }));
  }

  /// Common widget
  Widget _buildNotificationsRow(
    BuildContext context, {
    required String userImage,
    required String notifications,
    Function? onTapNotificationsRow,
  }) {
    return GestureDetector(
        onTap: () {
          onTapNotificationsRow!.call();
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 8.v),
            decoration: AppDecoration.outlineBlack900
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              CustomImageView(
                  imagePath: userImage,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 22.h),
                  child: Text(notifications,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: appTheme.black900)))
            ])));
  }

  /// Common widget
  Widget _buildHelpCenterRow(
    BuildContext context, {
    required String helpCenterText,
    Function? navigatetohelpcenter,
  }) {
    return GestureDetector(
        onTap: () {
          navigatetohelpcenter!.call();
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 2.v),
            decoration: AppDecoration.outlineBlack900
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgRssFeed,
                      height: 33.adaptSize,
                      width: 33.adaptSize,
                      margin: EdgeInsets.only(bottom: 2.v)),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 15.h, top: 9.v, bottom: 4.v),
                      child: Text(helpCenterText,
                          style: theme.textTheme.bodyMedium!
                              .copyWith(color: appTheme.black900)))
                ])));
  }

  /// Navigates to the profileScreen when the action is triggered.
  viewprofileaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profileScreen,
    );
  }

  /// Navigates to the notifspanelScreen when the action is triggered.
  onTapNotificationsRow(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notifspanelScreen,
    );
  }

  /// Navigates to the settingsContactusScreen when the action is triggered.
  navigatetohelpcenter(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsContactusScreen,
    );
  }

  /// Opens a URL in the device's default web browser.
  ///
  /// The [context] parameter is the `BuildContext` of the widget that invoked the function.
  ///
  /// Throws an exception if the URL could not be launched.
  onTapHelpCenterRow(BuildContext context) async {
    var url = 'https://www.apple.com/fr/app-store/';
    if (!await launchUrlString(url)) {
      throw 'Could not launch https://www.apple.com/fr/app-store/';
    }
  }

  /// Calls the https://nodedemo.dhiwise.co/device/api/v1/user/list API and triggers a [CreateListEvent] event on the [SettingsBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  logoutuser(BuildContext context) {
    context.read<SettingsBloc>().add(
      CreateListEvent(
        onCreateListEventSuccess: () {
          _onListUserEventSuccess(context);
        },
      ),
    );
  }

  /// Navigates to the splashScreen when the action is triggered.
  void _onListUserEventSuccess(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.splashScreen,
    );
  }
}
