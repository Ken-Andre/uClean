import 'bloc/home_bloc.dart';
import 'models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/widgets/app_bar/appbar_image.dart';
import 'package:uclean/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:uclean/widgets/app_bar/custom_app_bar.dart';
import 'package:uclean/widgets/custom_icon_button.dart';

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
                  height: 713.v,
                  width: double.maxFinite,
                  child: Stack(children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.only(top: 60.v, bottom: 131.v),
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
                                                        .imgPinkGrandient3,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20.v),
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgGroupYellow400,
                                      height: 96.v,
                                      width: 122.h,
                                      alignment: Alignment.center),
                                  SizedBox(height: 10.v),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text("msg_welcome_isabelle".tr,
                                          style: CustomTextStyles
                                              .headlineSmallPoppins)),
                                  SizedBox(height: 21.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 12.h),
                                      child: Text("msg_set_live_tracking".tr,
                                          style: CustomTextStyles
                                              .headlineSmallPoppinsBold)),
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
                                                    child: CustomIconButton(
                                                        height: 124.v,
                                                        width: 129.h,
                                                        decoration:
                                                            IconButtonStyleHelper
                                                                .radiusTL3,
                                                        alignment:
                                                            Alignment.center,
                                                        child: CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgVectorOn))),
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
                                  Padding(
                                      padding: EdgeInsets.only(left: 12.h),
                                      child: Text("msg_unclassified_trip".tr,
                                          style: CustomTextStyles
                                              .headlineSmallPoppinsBold)),
                                  Divider(
                                      color:
                                          appTheme.black900.withOpacity(0.25)),
                                  SizedBox(height: 22.v),
                                  _buildFrameNinetyThree(context),
                                  SizedBox(height: 2.v),
                                  _buildUnclassifiedTrips(context)
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
                  AppbarImage(imagePath: ImageConstant.imgLockBlack900),
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
    return Padding(
        padding: EdgeInsets.only(right: 2.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.v),
                  child: SizedBox(
                      width: 73.h, child: Divider(color: appTheme.gray500))),
              Text("msg_personnal_swipe".tr,
                  style: CustomTextStyles.bodySmallGray500),
              SizedBox(
                  height: 1.v,
                  width: 73.h,
                  child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          width: 73.h,
                          child: Divider(color: appTheme.gray500))))
            ]));
  }

  /// Section Widget
  Widget _buildUnclassifiedTrips(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: SizedBox(
            height: 224.v,
            width: 376.h,
            child: Stack(alignment: Alignment.center, children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: EdgeInsets.only(right: 30.h),
                      decoration: AppDecoration.outlineBlack9003,
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          decoration: AppDecoration.fillWhiteA.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder15),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 7.v),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 6.h, right: 9.h),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("lbl_10_2".tr,
                                              style: CustomTextStyles
                                                  .titleSmallBold),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 7.h, bottom: 5.v),
                                              child: Text("lbl_km2".tr,
                                                  style: CustomTextStyles
                                                      .bodySmall11)),
                                          Spacer(flex: 50),
                                          CustomImageView(
                                              imagePath: ImageConstant.imgUser,
                                              height: 21.v,
                                              width: 43.h),
                                          Spacer(flex: 49),
                                          Text("lbl_16_01_2024".tr,
                                              style: CustomTextStyles
                                                  .bodyMediumRegular15)
                                        ])),
                                SizedBox(height: 31.v),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 9.v),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text("lbl_13_12".tr,
                                                        style: CustomTextStyles
                                                            .bodyMediumRegular15)),
                                                SizedBox(height: 24.v),
                                                Text("lbl_14_15".tr,
                                                    style: CustomTextStyles
                                                        .bodyMediumRegular15)
                                              ])),
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgSettingsBlack900,
                                          height: 66.v,
                                          width: 12.h,
                                          margin: EdgeInsets.only(
                                              left: 1.h,
                                              top: 2.v,
                                              bottom: 12.v)),
                                      Padding(
                                          padding: EdgeInsets.only(left: 3.h),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("msg_douala_cameroon".tr,
                                                    style: theme
                                                        .textTheme.labelLarge),
                                                SizedBox(height: 1.v),
                                                Text(
                                                    "msg_entree_lycee_ndogpassi"
                                                        .tr,
                                                    style: CustomTextStyles
                                                        .bodyMediumInter),
                                                SizedBox(height: 14.v),
                                                Text("msg_douala_cameroon".tr,
                                                    style: theme
                                                        .textTheme.labelLarge),
                                                SizedBox(height: 1.v),
                                                Text(
                                                    "msg_entree_lycee_ndogpassi"
                                                        .tr,
                                                    style: CustomTextStyles
                                                        .bodyMediumInter)
                                              ]))
                                    ]),
                                SizedBox(height: 19.v),
                                Container(
                                    height: 36.v,
                                    width: 328.h,
                                    margin: EdgeInsets.only(left: 5.h),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  height: 34.v,
                                                  width: 28.h,
                                                  margin: EdgeInsets.only(
                                                      left: 20.h),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          appTheme.whiteA700))),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgLinkedin,
                                                        height: 17.v,
                                                        width: 9.h,
                                                        margin: EdgeInsets.only(
                                                            top: 10.v,
                                                            bottom: 8.v)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 11.h),
                                                        child: SizedBox(
                                                            height: 36.v,
                                                            child:
                                                                VerticalDivider(
                                                                    width: 1.h,
                                                                    thickness:
                                                                        1.v))),
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgCar,
                                                        height: 17.v,
                                                        width: 15.h,
                                                        margin: EdgeInsets.only(
                                                            left: 4.h,
                                                            top: 10.v,
                                                            bottom: 8.v)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 7.h),
                                                        child: SizedBox(
                                                            height: 36.v,
                                                            child:
                                                                VerticalDivider(
                                                                    width: 1.h,
                                                                    thickness:
                                                                        1.v))),
                                                    Spacer(),
                                                    SizedBox(
                                                        height: 36.v,
                                                        child: VerticalDivider(
                                                            width: 1.h,
                                                            thickness: 1.v)),
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgThumbsUp,
                                                        height: 17.v,
                                                        width: 11.h,
                                                        margin: EdgeInsets.only(
                                                            left: 6.h,
                                                            top: 10.v,
                                                            bottom: 8.v))
                                                  ]))
                                        ]))
                              ])))),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.h),
                      decoration: AppDecoration.outlineBlack9003,
                      child:
                          Column(mainAxisSize: MainAxisSize.min, children: [])))
            ])));
  }

  /// Navigates to the settingsautotrackScreen when the action is triggered.
  onTapImgSettings(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsautotrackScreen,
    );
  }
}
