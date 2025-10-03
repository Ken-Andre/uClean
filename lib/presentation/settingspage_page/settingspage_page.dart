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
        child: const SettingspagePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingspageBloc, SettingspageState>(
        builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: appTheme.gray10001,
          body: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.v),
                  Text("lbl_settings".tr,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 24.v),
                  Text("lbl_tracking".tr,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 12.v),
                  _buildCheckConfiguration(context),
                  SizedBox(height: 24.v),
                  Text("lbl_reporting".tr,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 12.v),
                  _buildReportingPeriods(context),
                  SizedBox(height: 24.v),
                  Text("lbl_account".tr,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 12.v),
                  _buildYourAccount(context),
                  SizedBox(height: 8.v),
                  _buildNotifications(context),
                  SizedBox(height: 8.v),
                  _buildTeams(context),
                  SizedBox(height: 24.v),
                  Text("lbl_support".tr,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 12.v),
                  _buildHelpCenter(context),
                  SizedBox(height: 24.v),
                  Text("lbl_our_app".tr,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 12.v),
                  _buildRankOurApp(context),
                  SizedBox(height: 24.v),
                  Center(child: _buildLogOut(context)),
                  SizedBox(height: 24.v),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgInbox,
                            height: 16.adaptSize,
                            width: 16.adaptSize),
                        SizedBox(width: 8.h),
                        Text("lbl_uclean_2024".tr,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontFamily: 'Inter',
                              color: appTheme.black900.withValues(alpha: 0.6),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 24.v)
                ],
              ),
            ),
          ),
        ),
      ); // La SafeArea est correctement fermée ici.
    });
  }

  /// Section Widget
  Widget _buildCheckConfiguration(BuildContext context) {
    return _buildSettingsCard(
      context,
      icon: ImageConstant.imgCheckmark,
      text: "msg_check_configuration".tr,
      onTap: () => onTapCheckConfiguration(context),
    );
  }

  /// Modern Settings Card Widget
  Widget _buildSettingsCard(BuildContext context,
      {required String icon,
      required String text,
      required VoidCallback onTap,
      bool isDisabled = false}) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: isDisabled
              ? appTheme.whiteA70001.withValues(alpha: 0.5)
              : appTheme.whiteA70001,
          borderRadius: BorderRadius.circular(12.h),
          boxShadow: [
            BoxShadow(
              color: appTheme.black900.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                color: appTheme.gray10001,
                borderRadius: BorderRadius.circular(8.h),
              ),
              child: CustomImageView(
                imagePath: icon,
                height: 20.adaptSize,
                width: 20.adaptSize,
              ),
            ),
            SizedBox(width: 16.h),
            Expanded(
              child: Text(
                text,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: isDisabled
                      ? appTheme.black900.withValues(alpha: 0.4)
                      : appTheme.black900,
                ),
              ),
            ),
            Icon(Icons.chevron_right,
                size: 20,
                color: isDisabled
                    ? appTheme.black900.withValues(alpha: 0.3)
                    : appTheme.black900.withValues(alpha: 0.6)),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildReportingPeriods(BuildContext context) {
    return _buildSettingsCard(
      context,
      icon: ImageConstant.imgSave,
      text: "msg_reporting_periods".tr,
      onTap: () => onTapReportingPeriods(context),
    );
  }

  /// Section Widget
  Widget _buildYourAccount(BuildContext context) {
    return _buildSettingsCard(
      context,
      icon: ImageConstant.imgLock,
      text: "lbl_your_account".tr,
      onTap: () => onTapYourAccount(context),
    );
  }

  /// Section Widget
  Widget _buildNotifications(BuildContext context) {
    return _buildSettingsCard(
      context,
      icon: ImageConstant.imgGroup,
      text: "lbl_notifications".tr,
      onTap: () => onTapNotifications(context),
    );
  }

  /// Section Widget
  Widget _buildTeams(BuildContext context) {
    return _buildSettingsCard(
      context,
      icon: ImageConstant.imgSave,
      text: "lbl_teams".tr,
      onTap: () {},
      isDisabled: true,
    );
  }

  /// Section Widget
  Widget _buildHelpCenter(BuildContext context) {
    return _buildSettingsCard(
      context,
      icon: ImageConstant.imgContrast,
      text: "lbl_help_center".tr,
      onTap: () => onTapHelpCenter(context),
    );
  }

  /// Section Widget
  Widget _buildRankOurApp(BuildContext context) {
    return _buildSettingsCard(
      context,
      icon: ImageConstant.imgSignal,
      text: "lbl_rank_our_app".tr,
      onTap: () => onTapRankOurApp(context),
    );
  }

  /// Section Widget
  Widget _buildLogOut(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 12.v),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFCD7A91), Color(0xFFFF7968)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25.h),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFF7968).withValues(alpha: 0.3),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => onTapLogOut(context),
        child: Text(
          "lbl_log_out".tr,
          style: theme.textTheme.titleMedium?.copyWith(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: appTheme.whiteA70001,
          ),
        ),
      ),
    );
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
