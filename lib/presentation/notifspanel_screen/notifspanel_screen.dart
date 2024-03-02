import 'package:ucleankim/widgets/app_bar/custom_app_bar.dart';
import 'package:ucleankim/widgets/app_bar/appbar_leading_image.dart';
import 'package:ucleankim/widgets/app_bar/appbar_title.dart';
import 'package:ucleankim/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ucleankim/widgets/custom_elevated_button.dart';
import 'models/notifspanel_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/notifspanel_bloc.dart';

class NotifspanelScreen extends StatelessWidget {
  const NotifspanelScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<NotifspanelBloc>(
        create: (context) => NotifspanelBloc(
            NotifspanelState(notifspanelModelObj: NotifspanelModel()))
          ..add(NotifspanelInitialEvent()),
        child: NotifspanelScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotifspanelBloc, NotifspanelState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: appTheme.gray10001,
              appBar: _buildAppBar(context),
              body: Container(
                  height: 741.v,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 39.v),
                  child: Stack(alignment: Alignment.bottomLeft, children: [
                    Opacity(
                        opacity: 0.6,
                        child: CustomImageView(
                            imagePath: ImageConstant.imgBlueGrandient271x97,
                            height: 271.v,
                            width: 97.h,
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 31.v))),
                    Opacity(
                        opacity: 0.3,
                        child: CustomImageView(
                            imagePath: ImageConstant.imgYellowGrandient271x101,
                            height: 271.v,
                            width: 101.h,
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(bottom: 5.v))),
                    Opacity(
                        opacity: 0.6,
                        child: CustomImageView(
                            imagePath: ImageConstant.imgPinkGrandient271x136,
                            height: 271.v,
                            width: 136.h,
                            alignment: Alignment.topLeft)),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 106.h, top: 135.v, right: 92.h),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant
                                          .imgGroupOnsecondarycontainer,
                                      height: 156.v,
                                      width: 184.h),
                                  SizedBox(height: 16.v),
                                  Opacity(
                                      opacity: 0.9,
                                      child: Container(
                                          width: 172.h,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10.h),
                                          child: Text("msg_you_haven_t_any".tr,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: CustomTextStyles
                                                  .titleLargeInterBlack900))),
                                  SizedBox(height: 11.v),
                                  CustomElevatedButton(
                                      text: "lbl_home".tr,
                                      leftIcon: Container(
                                          margin: EdgeInsets.only(right: 10.h),
                                          child: CustomImageView(
                                              imagePath: ImageConstant.imgHome,
                                              height: 24.adaptSize,
                                              width: 24.adaptSize)),
                                      buttonStyle: CustomButtonStyles
                                          .fillOnSecondaryContainer)
                                ])))
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 34.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 28.h, top: 23.v, bottom: 21.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_notifications".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMaterialSymbol,
              margin: EdgeInsets.fromLTRB(28.h, 16.v, 28.h, 15.v))
        ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
