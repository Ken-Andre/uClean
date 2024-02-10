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
                      _buildCheckmarkEditText(context),
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
                      SizedBox(height: 2.v),
                      _buildSaveEditText(context),
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
                              notifications: "lbl_your_account".tr)),
                      SizedBox(height: 2.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9.h),
                          child: _buildNotificationsRow(context,
                              userImage: ImageConstant.imgGroup,
                              notifications: "lbl_notifications".tr,
                              onTapNotificationsRow: () {
                            onTapNotificationsRow(context);
                          })),
                      SizedBox(height: 2.v),
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
                              helpCenterText: "lbl_help_center".tr)),
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
                              helpCenterText: "lbl_help_center".tr)),
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
                      SizedBox(height: 5.v)
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
  Widget _buildCheckmarkEditText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 9.h, right: 7.h),
        child:
            BlocSelector<SettingsBloc, SettingsState, TextEditingController?>(
                selector: (state) => state.checkmarkEditTextController,
                builder: (context, checkmarkEditTextController) {
                  return CustomTextFormField(
                      controller: checkmarkEditTextController,
                      hintText: "msg_check_configuration".tr,
                      hintStyle: theme.textTheme.bodyMedium!,
                      prefix: Container(
                          margin: EdgeInsets.fromLTRB(14.h, 7.v, 18.h, 7.v),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgCheckmark,
                              height: 24.adaptSize,
                              width: 24.adaptSize)),
                      prefixConstraints: BoxConstraints(maxHeight: 40.v),
                      contentPadding:
                          EdgeInsets.only(top: 9.v, right: 30.h, bottom: 9.v),
                      borderDecoration: TextFormFieldStyleHelper.fillPrimary);
                }));
  }

  /// Section Widget
  Widget _buildSaveEditText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 9.h),
        child:
            BlocSelector<SettingsBloc, SettingsState, TextEditingController?>(
                selector: (state) => state.saveEditTextController,
                builder: (context, saveEditTextController) {
                  return CustomTextFormField(
                      controller: saveEditTextController,
                      hintText: "msg_reporting_periods".tr,
                      hintStyle: theme.textTheme.bodyMedium!,
                      textInputAction: TextInputAction.done,
                      prefix: Container(
                          margin: EdgeInsets.fromLTRB(9.h, 8.v, 22.h, 8.v),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgSave,
                              height: 24.adaptSize,
                              width: 24.adaptSize)),
                      prefixConstraints: BoxConstraints(maxHeight: 40.v),
                      contentPadding:
                          EdgeInsets.only(top: 9.v, right: 30.h, bottom: 9.v),
                      borderDecoration: TextFormFieldStyleHelper.fillPrimary);
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
            buttonTextStyle: CustomTextStyles.bodyLargeOrange700));
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
            decoration: AppDecoration.fillPrimary
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
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 2.v),
        decoration: AppDecoration.fillPrimary
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
                  padding: EdgeInsets.only(left: 15.h, top: 9.v, bottom: 4.v),
                  child: Text(helpCenterText,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: appTheme.black900)))
            ]));
  }

  /// Navigates to the notifspanelScreen when the action is triggered.
  onTapNotificationsRow(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notifspanelScreen,
    );
  }
}
