import 'package:ucleankim/widgets/custom_elevated_button.dart';
import 'package:ucleankim/widgets/custom_text_form_field.dart';
import 'models/settingspage_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/settingspage_bloc.dart';

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
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray10001,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillGray,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 50.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSettings(context),
                          SizedBox(height: 8.v),
                          Padding(
                              padding: EdgeInsets.only(left: 19.h),
                              child: Text("lbl_tracking".tr,
                                  style: theme.textTheme.titleSmall)),
                          SizedBox(height: 2.v),
                          _buildCheckmark(context),
                          SizedBox(height: 11.v),
                          Padding(
                              padding: EdgeInsets.only(left: 19.h),
                              child: Text("lbl_reporting".tr,
                                  style: theme.textTheme.titleSmall)),
                          SizedBox(height: 2.v),
                          _buildSave(context),
                          SizedBox(height: 10.v),
                          Padding(
                              padding: EdgeInsets.only(left: 19.h),
                              child: Text("lbl_account".tr,
                                  style: theme.textTheme.titleSmall)),
                          SizedBox(height: 3.v),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.h),
                              child: _buildTabSubsection(context,
                                  save: ImageConstant.imgLock,
                                  teams: "lbl_your_account".tr)),
                          SizedBox(height: 4.v),
                          _buildFrame1(context),
                          SizedBox(height: 4.v),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.h),
                              child: _buildTabSubsection(context,
                                  save: ImageConstant.imgSave,
                                  teams: "lbl_teams".tr)),
                          SizedBox(height: 11.v),
                          Padding(
                              padding: EdgeInsets.only(left: 19.h),
                              child: Text("lbl_support".tr,
                                  style: theme.textTheme.titleSmall)),
                          SizedBox(height: 2.v),
                          _buildContrast(context),
                          SizedBox(height: 11.v),
                          Padding(
                              padding: EdgeInsets.only(left: 19.h),
                              child: Text("lbl_our_app".tr,
                                  style: theme.textTheme.titleSmall)),
                          SizedBox(height: 2.v),
                          _buildSignal(context),
                          SizedBox(height: 10.v),
                          _buildLogOut(context),
                          SizedBox(height: 11.v),
                          Opacity(
                              opacity: 0.7,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            imagePath: ImageConstant.imgInbox,
                                            height: 16.adaptSize,
                                            width: 16.adaptSize,
                                            margin: EdgeInsets.only(
                                                top: 2.v, bottom: 5.v)),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.h),
                                            child: Text("lbl_uclean_2024".tr,
                                                style:
                                                    theme.textTheme.bodyLarge))
                                      ]))),
                          SizedBox(height: 71.v)
                        ])))));
  }

  /// Section Widget
  Widget _buildSettings(BuildContext context) {
    return CustomElevatedButton(
        height: 46.v,
        text: "lbl_settings".tr,
        buttonStyle: CustomButtonStyles.outlineBlack1,
        buttonTextStyle: CustomTextStyles.titleLargeBlack900);
  }

  /// Section Widget
  Widget _buildCheckmark(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: BlocSelector<SettingspageBloc, SettingspageState,
                TextEditingController?>(
            selector: (state) => state.checkmarkController,
            builder: (context, checkmarkController) {
              return CustomTextFormField(
                  controller: checkmarkController,
                  hintText: "msg_check_configuration".tr,
                  hintStyle: CustomTextStyles.bodyMediumBlack900Light_2,
                  alignment: Alignment.center,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(14.h, 7.v, 10.h, 7.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgCheckmark,
                          height: 24.adaptSize,
                          width: 24.adaptSize)),
                  prefixConstraints: BoxConstraints(maxHeight: 38.v),
                  contentPadding:
                      EdgeInsets.only(top: 8.v, right: 30.h, bottom: 8.v),
                  borderDecoration: TextFormFieldStyleHelper.outlineBlack);
            }));
  }

  /// Section Widget
  Widget _buildSave(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.h, right: 8.h),
        child: BlocSelector<SettingspageBloc, SettingspageState,
                TextEditingController?>(
            selector: (state) => state.saveController,
            builder: (context, saveController) {
              return CustomTextFormField(
                  controller: saveController,
                  hintText: "msg_reporting_periods".tr,
                  hintStyle: CustomTextStyles.bodyMediumBlack900Light_2,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(9.h, 8.v, 22.h, 8.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgSave,
                          height: 24.adaptSize,
                          width: 24.adaptSize)),
                  prefixConstraints: BoxConstraints(maxHeight: 40.v),
                  contentPadding:
                      EdgeInsets.only(top: 9.v, right: 30.h, bottom: 9.v),
                  borderDecoration: TextFormFieldStyleHelper.outlineBlack);
            }));
  }

  /// Section Widget
  Widget _buildFrame1(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapFrame1(context);
        },
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 9.h),
            padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 8.v),
            decoration: AppDecoration.outlineBlack900
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgGroup,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 22.h),
                  child: Text("lbl_notifications".tr,
                      style: CustomTextStyles.bodyMediumBlack900Light_2))
            ])));
  }

  /// Section Widget
  Widget _buildContrast(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.h, right: 8.h),
        child: BlocSelector<SettingspageBloc, SettingspageState,
                TextEditingController?>(
            selector: (state) => state.contrastController,
            builder: (context, contrastController) {
              return CustomTextFormField(
                  controller: contrastController,
                  hintText: "lbl_help_center".tr,
                  hintStyle: CustomTextStyles.bodyMediumBlack900Light_2,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(14.h, 8.v, 22.h, 11.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgContrast,
                          height: 20.adaptSize,
                          width: 20.adaptSize)),
                  prefixConstraints: BoxConstraints(maxHeight: 39.v),
                  contentPadding:
                      EdgeInsets.only(top: 8.v, right: 30.h, bottom: 8.v),
                  borderDecoration: TextFormFieldStyleHelper.outlineBlack);
            }));
  }

  /// Section Widget
  Widget _buildSignal(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.h, right: 9.h),
        child: BlocSelector<SettingspageBloc, SettingspageState,
                TextEditingController?>(
            selector: (state) => state.signalController,
            builder: (context, signalController) {
              return CustomTextFormField(
                  controller: signalController,
                  hintText: "lbl_rank_our_app".tr,
                  hintStyle: CustomTextStyles.bodyMediumBlack900Light_2,
                  textInputAction: TextInputAction.done,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(12.h, 7.v, 20.h, 8.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgSignal,
                          height: 24.adaptSize,
                          width: 24.adaptSize)),
                  prefixConstraints: BoxConstraints(maxHeight: 39.v),
                  contentPadding:
                      EdgeInsets.only(top: 8.v, right: 30.h, bottom: 8.v),
                  borderDecoration: TextFormFieldStyleHelper.outlineBlack);
            }));
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
            },
            alignment: Alignment.center));
  }

  /// Common widget
  Widget _buildTabSubsection(
    BuildContext context, {
    required String save,
    required String teams,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 8.v),
        decoration: AppDecoration.outlineBlack9001
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          CustomImageView(
              imagePath: save, height: 24.adaptSize, width: 24.adaptSize),
          Padding(
              padding: EdgeInsets.only(left: 22.h),
              child: Text(teams,
                  style: CustomTextStyles.bodyMediumBlack900Light
                      .copyWith(color: appTheme.black900.withOpacity(0.65))))
        ]));
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapFrame(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profileScreen,
    );
  }

  /// Navigates to the notifspanelScreen when the action is triggered.
  onTapFrame1(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notifspanelScreen,
    );
  }

  /// Navigates to the splashScreen when the action is triggered.
  onTapLogOut(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.splashScreen,
    );
  }
}
