import 'package:permission_handler/permission_handler.dart';
import 'package:ucleankim/widgets/custom_elevated_button.dart';
import 'models/settingspage_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/settingspage_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingspagePage extends StatelessWidget {
  const SettingspagePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingspageBloc>(
        create: (context) => SettingspageBloc(
            SettingspageState(settingspageModelObj: SettingspageModel()))
          ..add(SettingspageInitialEvent()),
        child: SettingspagePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingspageBloc, SettingspageState>(
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
                  body: Container(
                      width: double.maxFinite,
                      decoration: AppDecoration.fillGray,
                      child: Column(children: [
                        _buildSettings(context),
                        SizedBox(height: 8.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 19.h),
                                child: Text("lbl_tracking".tr,
                                    style: theme.textTheme.titleSmall))),
                        SizedBox(height: 2.v),
                        _buildCheckConfiguration(context),
                        SizedBox(height: 11.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 19.h),
                                child: Text("lbl_reporting".tr,
                                    style: theme.textTheme.titleSmall))),
                        SizedBox(height: 2.v),
                        _buildReportingPeriods(context),
                        SizedBox(height: 10.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 19.h),
                                child: Text("lbl_account".tr,
                                    style: theme.textTheme.titleSmall))),
                        SizedBox(height: 3.v),
                        _buildYourAccount(context),
                        SizedBox(height: 4.v),
                        _buildNotifications(context),
                        SizedBox(height: 4.v),
                        _buildTeams(context),
                        SizedBox(height: 11.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 19.h),
                                child: Text("lbl_support".tr,
                                    style: theme.textTheme.titleSmall))),
                        SizedBox(height: 2.v),
                        _buildHelpCenter(context),
                        SizedBox(height: 11.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 19.h),
                                child: Text("lbl_our_app".tr,
                                    style: theme.textTheme.titleSmall))),
                        SizedBox(height: 2.v),
                        _buildRankOurApp(context),
                        SizedBox(height: 10.v),
                        _buildLogOut(context),
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
                                          style: CustomTextStyles
                                              .bodyLargePoppinsBlack900_3))
                                ])),
                        SizedBox(height: 5.v)
                      ]))));
        });
  }

  /// Section Widget
  Widget _buildSettings(BuildContext context) {
    return CustomElevatedButton(
        height: 46.v,
        text: "lbl_settings".tr,
        buttonStyle: CustomButtonStyles.outlineBlack1,
        buttonTextStyle: CustomTextStyles.titleLargeBlack900,
        alignment: Alignment.centerLeft);
  }

  /// Section Widget
  Widget _buildCheckConfiguration(BuildContext context) {
    return CustomElevatedButton(
        height: 38.v,
        text: "msg_check_configuration".tr,
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 10.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgCheckmark,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        buttonStyle: CustomButtonStyles.fillWhiteA,
        buttonTextStyle: theme.textTheme.bodyMedium!,
        onPressed: () {
          onTapCheckConfiguration(context);
        });
  }

  /// Section Widget
  Widget _buildReportingPeriods(BuildContext context) {
    return CustomElevatedButton(
        height: 40.v,
        text: "msg_reporting_periods".tr,
        margin: EdgeInsets.only(left: 10.h, right: 8.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 22.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgSave,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        buttonStyle: CustomButtonStyles.fillWhiteA,
        buttonTextStyle: theme.textTheme.bodyMedium!,
        onPressed: () {
          onTapReportingPeriods(context);
        },
        alignment: Alignment.centerLeft);
  }

  /// Section Widget
  Widget _buildYourAccount(BuildContext context) {
    return CustomElevatedButton(
        height: 38.v,
        text: "lbl_your_account".tr,
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 18.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgLock,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        buttonStyle: CustomButtonStyles.fillWhiteA,
        buttonTextStyle: theme.textTheme.bodyMedium!,
        onPressed: () {
          onTapYourAccount(context);
        });
  }

  /// Section Widget
  Widget _buildNotifications(BuildContext context) {
    return CustomElevatedButton(
        height: 40.v,
        text: "lbl_notifications".tr,
        margin: EdgeInsets.only(left: 10.h, right: 8.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 22.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgGroup,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        buttonStyle: CustomButtonStyles.fillWhiteA,
        buttonTextStyle: theme.textTheme.bodyMedium!,
        onPressed: () {
          onTapNotifications(context);
        },
        alignment: Alignment.centerLeft);
  }

  /// Section Widget
  Widget _buildTeams(BuildContext context) {
    return CustomElevatedButton(
        height: 40.v,
        text: "lbl_teams".tr,
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 22.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgSave,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        buttonStyle: CustomButtonStyles.fillWhiteA,
        buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
        isDisabled: true);
  }

  /// Section Widget
  Widget _buildHelpCenter(BuildContext context) {
    return CustomElevatedButton(
        height: 39.v,
        text: "lbl_help_center".tr,
        margin: EdgeInsets.only(left: 10.h, right: 8.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 22.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgContrast,
                height: 20.adaptSize,
                width: 20.adaptSize)),
        buttonStyle: CustomButtonStyles.fillWhiteA,
        buttonTextStyle: theme.textTheme.bodyMedium!,
        onPressed: () {
          onTapHelpCenter(context);
        },
        alignment: Alignment.centerLeft);
  }

  /// Section Widget
  Widget _buildRankOurApp(BuildContext context) {
    return CustomElevatedButton(
        height: 39.v,
        text: "lbl_rank_our_app".tr,
        margin: EdgeInsets.only(left: 10.h, right: 9.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 20.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgSignal,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        buttonStyle: CustomButtonStyles.fillWhiteA,
        buttonTextStyle: theme.textTheme.bodyMedium!,
        onPressed: () {
          onTapRankOurApp(context);
        },
        alignment: Alignment.centerLeft);
  }

  /// Section Widget
  Widget _buildLogOut(BuildContext context) {
    return Opacity(
        opacity: 0.67,
        child: CustomElevatedButton(
            width: 185.h,
            text: "lbl_log_out".tr,
            buttonStyle: CustomButtonStyles.fillOnError,
            buttonTextStyle: CustomTextStyles.bodyLargeOrange700,
            onPressed: () {
              onTapLogOut(context);
            }));
  }

  /// Asks the user for permission to access their device's location using the
  /// [PermissionManager] plugin.
  ///
  /// Throws an error if the permission is permanently denied or the user has
  /// selected "don't ask again".
  onTapCheckConfiguration(BuildContext context) async {
    await PermissionManager.askForPermission(Permission.location);
  }

  /// Navigates to the settingsAutoTrackScreen when the action is triggered.
  onTapReportingPeriods(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsAutoTrackScreen,
    );
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapYourAccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profileScreen,
    );
  }

  /// Navigates to the notifspanelScreen when the action is triggered.
  onTapNotifications(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notifspanelScreen,
    );
  }

  /// Navigates to the settingsContactusScreen when the action is triggered.
  onTapHelpCenter(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsContactusScreen,
    );
  }

  /// Opens a URL in the device's default web browser.
  ///
  /// The [context] parameter is the `BuildContext` of the widget that invoked the function.
  ///
  /// Throws an exception if the URL could not be launched.
  onTapRankOurApp(BuildContext context) async {
    var url = 'https://github.com/Ken-Andre/uclean';
    if (!await launchUrlString(url)) {
      throw 'Could not launch https://github.com/Ken-Andre/uclean';
    }
  }

  /// Calls the https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/logout API and triggers a [CreateLogoutEvent] event on the [SettingspageBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  onTapLogOut(BuildContext context) {
    context.read<SettingspageBloc>().add(
      CreateLogoutEvent(
        onCreateLogoutEventSuccess: () {
          _onLogoutPostEventSuccess(context);
        },
        onCreateLogoutEventError: () {
          _onLogoutPostEventError(context);
        },
      ),
    );
  }

  /// Navigates to the splashScreen when the action is triggered.
  void _onLogoutPostEventSuccess(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.splashScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onLogoutPostEventError(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Who are you? We can't log you out :|",
      timeInSecForIosWeb: 5,
    );
  }
}
