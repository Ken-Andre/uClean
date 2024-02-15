import 'bloc/home_bloc.dart';
import 'models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/widgets/app_bar/appbar_image.dart';
import 'package:uclean/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:uclean/widgets/app_bar/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(HomeState(homeModelObj: HomeModel()))
          ..add(HomeInitialEvent()),
        child: HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: appTheme.gray5001,
              appBar: _buildAppBar(context),
              body: SizedBox(
                  height: 679.v,
                  width: double.maxFinite,
                  child: Stack(children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.only(top: 60.v, bottom: 97.v),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: 522.v,
                                      width: 136.h,
                                      child: Stack(
                                          alignment: Alignment.topCenter,
                                          children: [
                                            Opacity(
                                                opacity: 0.3,
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgYellowGrandient4,
                                                    height: 271.v,
                                                    width: 101.h,
                                                    alignment:
                                                        Alignment.bottomLeft)),
                                            Opacity(
                                                opacity: 0.6,
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgPinkGrandient4,
                                                    height: 271.v,
                                                    width: 136.h,
                                                    alignment:
                                                        Alignment.topCenter))
                                          ])),
                                  Opacity(
                                      opacity: 0.6,
                                      child: CustomImageView(
                                          imagePath: ImageConstant
                                              .imgBlueGrandient271x69,
                                          height: 271.v,
                                          width: 69.h,
                                          margin: EdgeInsets.only(
                                              top: 31.v, bottom: 220.v)))
                                ]))),
                    SingleChildScrollView(
                        child: Container(
                            decoration: AppDecoration.fillPrimary1,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 20.v),
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgGroupYellow400,
                                      height: 96.v,
                                      width: 122.h),
                                  SizedBox(height: 10.v),
                                  Text("msg_welcome_isabelle".tr,
                                      style: CustomTextStyles
                                          .headlineSmallPoppins_1),
                                  SizedBox(height: 21.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 12.h),
                                          child: Text(
                                              "msg_set_live_tracking".tr,
                                              style: CustomTextStyles
                                                  .headlineSmallPoppinsBold))),
                                  Divider(
                                      color:
                                          appTheme.black900.withOpacity(0.25)),
                                  SizedBox(height: 24.v),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 23.h),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    height: 135.v,
                                                    width: 141.h,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.h,
                                                            vertical: 4.v),
                                                    decoration: AppDecoration
                                                        .fillBlueGray
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder23),
                                                    child: CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgVectorOn,
                                                        height: 124.v,
                                                        width: 129.h,
                                                        alignment:
                                                            Alignment.center)),
                                                Container(
                                                    height: 27.v,
                                                    width: 84.h,
                                                    margin: EdgeInsets.only(
                                                        left: 20.h,
                                                        bottom: 108.v),
                                                    child: Stack(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        children: [
                                                          CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgSettings,
                                                              height: 27.v,
                                                              width: 84.h,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              onTap: () {
                                                                onTapImgSettings(
                                                                    context);
                                                              }),
                                                          Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              child: Padding(
                                                                  padding:
                                                                      EdgeInsets.only(
                                                                          top: 1
                                                                              .v),
                                                                  child: Text(
                                                                      "lbl_configure"
                                                                          .tr,
                                                                      style: CustomTextStyles
                                                                          .titleSmallPrimary)))
                                                        ]))
                                              ]))),
                                  SizedBox(height: 25.v),
                                  Divider(
                                      color:
                                          appTheme.black900.withOpacity(0.25)),
                                  SizedBox(height: 18.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 13.h),
                                          child: Text(
                                              "msg_unclassified_trip".tr,
                                              style: CustomTextStyles
                                                  .headlineSmallPoppinsBold))),
                                  Divider(
                                      color:
                                          appTheme.black900.withOpacity(0.25)),
                                  SizedBox(height: 22.v),
                                  _buildFrameNinetyThree(context),
                                  SizedBox(height: 21.v),
                                  _buildUntripOne(context)
                                ])))
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 90.v,
        centerTitle: true,
        title: Container(
            decoration: AppDecoration.fillPrimary,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppbarImage(
                      imagePath: ImageConstant.imgLockBlack900,
                      onTap: () {
                        onTapLock(context);
                      }),
                  Container(
                      margin:
                          EdgeInsets.only(left: 290.h, top: 2.v, bottom: 2.v),
                      padding: EdgeInsets.symmetric(horizontal: 6.h),
                      decoration: AppDecoration.fillLightGreen.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder9),
                      child: Row(children: [
                        AppbarSubtitleOne(text: "lbl_127".tr),
                        AppbarImage(
                            imagePath: ImageConstant.imgClose,
                            margin: EdgeInsets.fromLTRB(9.h, 5.v, 5.h, 4.v))
                      ]))
                ])),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildFrameNinetyThree(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 8.v),
              child: SizedBox(
                  width: 73.h, child: Divider(color: appTheme.gray500))),
          Text("msg_personnal_swipe".tr,
              style: CustomTextStyles.bodySmallGray500),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 8.v),
              child: SizedBox(
                  width: 73.h, child: Divider(color: appTheme.gray500)))
        ]);
  }

  /// Section Widget
  Widget _buildUntripOne(BuildContext context) {
    return SizedBox(
        height: 200.v,
        width: 347.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 7.v),
                  decoration: AppDecoration.fillWhiteA
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 1.h),
                            child: Row(children: [
                              Text("lbl_6_9".tr,
                                  style: CustomTextStyles.titleSmallBold),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 12.h, top: 2.v, bottom: 3.v),
                                  child: Text("lbl_km2".tr,
                                      style: CustomTextStyles.bodySmall11)),
                              Spacer(flex: 56),
                              CustomImageView(
                                  imagePath: ImageConstant.imgUserGray100,
                                  height: 21.v,
                                  width: 35.h),
                              Spacer(flex: 43),
                              Text("lbl_16_01_2024".tr,
                                  style: CustomTextStyles.bodyMediumRegular15)
                            ])),
                        SizedBox(height: 31.v),
                        SizedBox(
                            height: 8.v,
                            width: 203.h,
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 42.h),
                                          child: SizedBox(
                                              height: 49.v,
                                              child: VerticalDivider(
                                                  width: 1.h,
                                                  thickness: 1.v,
                                                  indent: 21.h)))),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 9.v),
                                                child: Text("lbl_19_15".tr,
                                                    style: CustomTextStyles
                                                        .bodyMediumRegular15)),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgVector,
                                                height: 18.v,
                                                width: 12.h,
                                                margin: EdgeInsets.only(
                                                    left: 3.h,
                                                    top: 2.v,
                                                    bottom: 12.v)),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 3.h),
                                                child: _buildStartAddress(
                                                    context,
                                                    locationName:
                                                        "msg_douala_cameroon"
                                                            .tr,
                                                    entranceName:
                                                        "msg_entree_lycee_ndogpassi"
                                                            .tr))
                                          ])),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 5.v),
                                                child: Text("lbl_17_12".tr,
                                                    style: CustomTextStyles
                                                        .bodyMediumRegular15)),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgVector,
                                                height: 18.v,
                                                width: 12.h,
                                                margin: EdgeInsets.only(
                                                    left: 2.h,
                                                    top: 2.v,
                                                    bottom: 12.v)),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 3.h),
                                                child: _buildStartAddress(
                                                    context,
                                                    locationName:
                                                        "msg_douala_cameroon"
                                                            .tr,
                                                    entranceName:
                                                        "msg_entree_lycee_ndogpassi"
                                                            .tr))
                                          ]))
                                ])),
                        SizedBox(height: 48.v)
                      ]))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(top: 164.v),
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  decoration: AppDecoration.outlineBlack9002.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderBL8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgLinkedin,
                            height: 17.v,
                            width: 9.h,
                            margin: EdgeInsets.only(top: 9.v, bottom: 8.v)),
                        Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: SizedBox(
                                height: 35.v,
                                child: VerticalDivider(
                                    width: 1.h,
                                    thickness: 1.v,
                                    color: appTheme.black900.withOpacity(0.35),
                                    endIndent: 1.h))),
                        CustomImageView(
                            imagePath: ImageConstant.imgCar,
                            height: 17.v,
                            width: 15.h,
                            margin: EdgeInsets.only(
                                left: 5.h, top: 9.v, bottom: 8.v)),
                        Padding(
                            padding: EdgeInsets.only(left: 7.h),
                            child: SizedBox(
                                height: 35.v,
                                child: VerticalDivider(
                                    width: 1.h,
                                    thickness: 1.v,
                                    color: appTheme.black900.withOpacity(0.35),
                                    endIndent: 1.h))),
                        Spacer(),
                        SizedBox(
                            height: 35.v,
                            child: VerticalDivider(
                                width: 1.h,
                                thickness: 1.v,
                                color: appTheme.black900.withOpacity(0.35),
                                endIndent: 1.h)),
                        CustomImageView(
                            imagePath: ImageConstant.imgThumbsUp,
                            height: 17.v,
                            width: 11.h,
                            margin: EdgeInsets.only(
                                left: 7.h, top: 9.v, bottom: 8.v))
                      ])))
        ]));
  }

  /// Common widget
  Widget _buildStartAddress(
    BuildContext context, {
    required String locationName,
    required String entranceName,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(locationName,
          style: CustomTextStyles.labelLargeInter
              .copyWith(color: appTheme.black900)),
      SizedBox(height: 43.v),
      Text(entranceName,
          style: CustomTextStyles.bodyMediumInter
              .copyWith(color: appTheme.black900))
    ]);
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapLock(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profileScreen,
    );
  }

  /// Navigates to the settingsautotrackScreen when the action is triggered.
  onTapImgSettings(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsautotrackScreen,
    );
  }
}
