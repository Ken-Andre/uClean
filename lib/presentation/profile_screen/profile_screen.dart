import 'bloc/profile_bloc.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/widgets/app_bar/appbar_leading_image.dart';
import 'package:uclean/widgets/app_bar/appbar_title.dart';
import 'package:uclean/widgets/app_bar/custom_app_bar.dart';
import 'package:uclean/widgets/custom_elevated_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
        create: (context) =>
            ProfileBloc(ProfileState(profileModelObj: ProfileModel()))
              ..add(ProfileInitialEvent()),
        child: ProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: appTheme.red50,
              appBar: _buildAppBar(context),
              body: Container(
                  height: 741.v,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 27.v),
                  child: Stack(alignment: Alignment.bottomLeft, children: [
                    Opacity(
                        opacity: 0.6,
                        child: CustomImageView(
                            imagePath: ImageConstant.imgBlueGrandient1,
                            height: 271.v,
                            width: 97.h,
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 42.v))),
                    Opacity(
                        opacity: 0.3,
                        child: CustomImageView(
                            imagePath: ImageConstant.imgYellowGrandient1,
                            height: 271.v,
                            width: 101.h,
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(bottom: 5.v))),
                    Opacity(
                        opacity: 0.6,
                        child: CustomImageView(
                            imagePath: ImageConstant.imgPinkGrandient1,
                            height: 271.v,
                            width: 136.h,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 11.v))),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 44.h),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("lbl_names".tr,
                                          style: theme.textTheme.bodyLarge)),
                                  SizedBox(height: 10.v),
                                  _buildFrameNinetyNine(context,
                                      phoneNumber: "lbl_isabelle_karol".tr,
                                      editText: "lbl_edit".tr),
                                  SizedBox(height: 39.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("lbl_phone_number".tr,
                                          style: theme.textTheme.bodyLarge)),
                                  SizedBox(height: 10.v),
                                  _buildFrameNinetyNine(context,
                                      phoneNumber: "lbl_209_555_0104".tr,
                                      editText: "lbl_edit".tr),
                                  SizedBox(height: 39.v),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                              Text("lbl_email".tr,
                                                  style: theme
                                                      .textTheme.bodyLarge),
                                              SizedBox(height: 12.v),
                                              Opacity(
                                                  opacity: 0.8,
                                                  child: Text(
                                                      "msg_felicia_reid_example_com"
                                                          .tr,
                                                      style: CustomTextStyles
                                                          .bodyLargeInterBlack90018))
                                            ])),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 53.h,
                                                top: 34.v,
                                                bottom: 3.v),
                                            child: Text("lbl_edit".tr,
                                                style: CustomTextStyles
                                                    .bodyLargeInterOrange600))
                                      ]),
                                  SizedBox(height: 38.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("lbl_password".tr,
                                          style: theme.textTheme.bodyLarge)),
                                  SizedBox(height: 7.v),
                                  _buildFrameNinetyNine(context,
                                      phoneNumber: "lbl".tr,
                                      editText: "lbl_edit".tr),
                                  SizedBox(height: 31.v),
                                  CustomElevatedButton(
                                      text: "lbl_save".tr,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 11.h),
                                      buttonStyle: CustomButtonStyles.fillCyan,
                                      buttonTextStyle:
                                          CustomTextStyles.bodyLargeBluegray100)
                                ])))
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 68.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrow1,
            margin: EdgeInsets.only(left: 47.h, top: 28.v, bottom: 24.v),
            onTap: () {
              onBackPressed(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_profile".tr));
  }

  /// Common widget
  Widget _buildFrameNinetyNine(
    BuildContext context, {
    required String phoneNumber,
    required String editText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Opacity(
          opacity: 0.8,
          child: Text(phoneNumber,
              style: CustomTextStyles.bodyLargeInterBlack90018
                  .copyWith(color: appTheme.black900.withOpacity(0.64)))),
      Text(editText,
          style: CustomTextStyles.bodyLargeInterOrange600
              .copyWith(color: appTheme.orange600))
    ]);
  }

  /// Navigates to the previous screen.
  onBackPressed(BuildContext context) {
    NavigatorService.goBack();
  }
}
