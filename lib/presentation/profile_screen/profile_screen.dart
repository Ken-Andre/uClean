import 'package:ucleankim/widgets/app_bar/custom_app_bar.dart';
import 'package:ucleankim/widgets/app_bar/appbar_leading_image.dart';
import 'package:ucleankim/widgets/app_bar/appbar_title.dart';
import 'package:ucleankim/widgets/custom_elevated_button.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/profile_bloc.dart';

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
              backgroundColor: appTheme.gray10001,
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
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("lbl_names".tr,
                                                  style: theme
                                                      .textTheme.bodyLarge),
                                              SizedBox(height: 10.v),
                                              Opacity(
                                                  opacity: 0.8,
                                                  child: Text(
                                                      "lbl_isabelle_karol".tr,
                                                      style: CustomTextStyles
                                                          .bodyLargeInterBlack90018))
                                            ]),
                                        Padding(
                                            padding: EdgeInsets.only(top: 34.v),
                                            child: Text("lbl_edit".tr,
                                                style: CustomTextStyles
                                                    .bodyLargeInterErrorContainer))
                                      ]),
                                  SizedBox(height: 39.v),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("lbl_phone_number".tr,
                                                  style: theme
                                                      .textTheme.bodyLarge),
                                              SizedBox(height: 10.v),
                                              Opacity(
                                                  opacity: 0.8,
                                                  child: Text(
                                                      "lbl_209_555_0104".tr,
                                                      style: CustomTextStyles
                                                          .bodyLargeInterBlack90018))
                                            ]),
                                        Padding(
                                            padding: EdgeInsets.only(top: 34.v),
                                            child: Text("lbl_edit".tr,
                                                style: CustomTextStyles
                                                    .bodyLargeInterErrorContainer))
                                      ]),
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
                                                    .bodyLargeInterErrorContainer))
                                      ]),
                                  SizedBox(height: 38.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("lbl_password".tr,
                                          style: theme.textTheme.bodyLarge)),
                                  SizedBox(height: 7.v),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Opacity(
                                            opacity: 0.8,
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 1.v),
                                                child: Text("lbl".tr,
                                                    style: CustomTextStyles
                                                        .bodyLargeInterBlack90018))),
                                        Padding(
                                            padding: EdgeInsets.only(top: 3.v),
                                            child: Text("lbl_edit".tr,
                                                style: CustomTextStyles
                                                    .bodyLargeInterErrorContainer))
                                      ]),
                                  SizedBox(height: 31.v),
                                  Opacity(
                                      opacity: 0.8,
                                      child: CustomElevatedButton(
                                          text: "lbl_save".tr,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 11.h),
                                          buttonStyle: CustomButtonStyles
                                              .fillOnSecondaryContainerTL10,
                                          buttonTextStyle: CustomTextStyles
                                              .bodyLargeWhiteA70001_1))
                                ])))
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 50.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 44.h, top: 23.v, bottom: 21.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_profile".tr));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
