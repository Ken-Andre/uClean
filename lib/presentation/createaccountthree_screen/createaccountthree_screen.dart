import 'package:ucleankim/widgets/custom_elevated_button.dart';
import 'models/createaccountthree_model.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/createaccountthree_bloc.dart';

class CreateaccountthreeScreen extends StatelessWidget {
  const CreateaccountthreeScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    // var arg =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return BlocProvider<CreateaccountthreeBloc>(
        create: (context) => CreateaccountthreeBloc(CreateaccountthreeState(
              createaccountthreeModelObj: CreateaccountthreeModel(),
              // token: arg[NavigationArgs.token]
            ))
              ..add(CreateaccountthreeInitialEvent()),
        child: CreateaccountthreeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateaccountthreeBloc, CreateaccountthreeState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  height: SizeUtils.height,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 122.v),
                  child: Stack(alignment: Alignment.topRight, children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Opacity(
                            opacity: 0.8,
                            child: Container(
                                width: 323.h,
                                margin: EdgeInsets.only(top: 100.v),
                                child: Text("msg_enjoy_your_experience".tr,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles
                                        .bodyLargeInterGray900a2)))),
                    Opacity(
                        opacity: 0.6,
                        child: CustomImageView(
                            imagePath: ImageConstant.imgBlueGrandient4,
                            height: 271.v,
                            width: 97.h,
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 59.v))),
                    Opacity(
                        opacity: 0.3,
                        child: CustomImageView(
                            imagePath: ImageConstant.imgYellowGrandient3,
                            height: 271.v,
                            width: 101.h,
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(bottom: 58.v))),
                    Opacity(
                        opacity: 0.6,
                        child: CustomImageView(
                            imagePath: ImageConstant.imgPinkGrandient3,
                            height: 271.v,
                            width: 136.h,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 28.v))),
                    _buildWelcome(context),
                    CustomElevatedButton(
                        width: 185.h,
                        text: "lbl_continue".tr,
                        margin: EdgeInsets.only(bottom: 173.v),
                        onPressed: () {
                          onTapContinue(context);
                        },
                        alignment: Alignment.bottomCenter),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                            padding: EdgeInsets.only(top: 53.v),
                            child: Text("msg_thanks_for_joining".tr,
                                style: CustomTextStyles.titleLargeInter))),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 89.h),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomElevatedButton(
                                      height: 40.v,
                                      text: "lbl_instagram".tr,
                                      leftIcon: Container(
                                          margin: EdgeInsets.only(right: 10.h),
                                          child: CustomImageView(
                                              imagePath: ImageConstant.imgInfo,
                                              height: 18.adaptSize,
                                              width: 18.adaptSize)),
                                      buttonStyle:
                                          CustomButtonStyles.fillPrimaryTL10,
                                      buttonTextStyle: CustomTextStyles
                                          .bodyLargeDeeporange300,
                                      onPressed: () {
                                        openInstagram(context);
                                      }),
                                  SizedBox(height: 13.v),
                                  CustomElevatedButton(
                                      height: 40.v,
                                      text: "lbl_linkedin".tr,
                                      leftIcon: Container(
                                          margin: EdgeInsets.only(right: 9.h),
                                          child: CustomImageView(
                                              imagePath: ImageConstant.imgLink,
                                              height: 17.adaptSize,
                                              width: 17.adaptSize)),
                                      buttonStyle:
                                          CustomButtonStyles.fillPrimaryTL10,
                                      buttonTextStyle:
                                          CustomTextStyles.bodyLargeBlue300,
                                      onPressed: () {
                                        openLinkedin(context);
                                      })
                                ]))),
                    _buildFrameFive(context)
                  ]))));
    });
  }

  /// Section Widget
  Widget _buildWelcome(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            margin: EdgeInsets.only(left: 21.h, top: 166.v, right: 27.h),
            padding: EdgeInsets.symmetric(horizontal: 105.h, vertical: 2.v),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: fs.Svg(ImageConstant.imgWelcome),
                    fit: BoxFit.cover)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 152.v),
                  Container(
                      width: 124.h,
                      margin: EdgeInsets.only(left: 9.h),
                      child: Text("msg_nice_to_meet_you".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleMediumInter))
                ])));
  }

  /// Section Widget
  Widget _buildFrameFive(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.only(bottom: 116.v),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Opacity(
                  opacity: 0.7,
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.v),
                      child: SizedBox(
                          width: 105.h,
                          child: Divider(
                              color: appTheme.black900.withOpacity(0.6))))),
              Opacity(
                  opacity: 0.7,
                  child: Text("lbl_follow_us_on".tr,
                      style: CustomTextStyles.bodyLargeInterBlack900)),
              Opacity(
                  opacity: 0.7,
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.v),
                      child: SizedBox(
                          width: 105.h,
                          child: Divider(
                              color: appTheme.black900.withOpacity(0.6)))))
            ])));
  }

  /// Navigates to the learnContainerScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    NavigatorService.pushNamed(
      // AppRoutes.learnContainerScreen,
      AppRoutes.homeContainerScreen,
    );
  }

  /// Opens a URL in the device's default web browser.
  ///
  /// The [context] parameter is the `BuildContext` of the widget that invoked the function.
  ///
  /// Throws an exception if the URL could not be launched.
  openInstagram(BuildContext context) async {
    var url = 'https:www.instagram.com';
    if (!await launchUrlString(url)) {
      throw 'Could not launch https:www.instagram.com';
    }
  }

  /// Opens a URL in the device's default web browser.
  ///
  /// The [context] parameter is the `BuildContext` of the widget that invoked the function.
  ///
  /// Throws an exception if the URL could not be launched.
  openLinkedin(BuildContext context) async {
    var url = 'https://www.linkedin.com';
    if (!await launchUrlString(url)) {
      throw 'Could not launch https://www.linkedin.com';
    }
  }
}
