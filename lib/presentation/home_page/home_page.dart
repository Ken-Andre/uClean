import 'package:ucleankim/widgets/app_bar/custom_app_bar.dart';
import 'package:ucleankim/widgets/app_bar/appbar_image.dart';
import 'package:ucleankim/widgets/app_bar/appbar_subtitle_one.dart';
import 'models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/home_bloc.dart';

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
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 34.v),
                    child: Column(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgGroupYellow400,
                          height: 96.v,
                          width: 122.h),
                      SizedBox(height: 10.v),
                      BlocSelector<HomeBloc, HomeState, String?>(
                          selector: (state) =>
                              state.homeModelObj!.welcomeIsabelle,
                          builder: (context, welcomeIsabelle) {
                            return Text(welcomeIsabelle ?? "",
                                style: CustomTextStyles.headlineSmallPoppins_1);
                          }),
                      SizedBox(height: 23.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 14.h),
                              child: Text("msg_set_live_tracking".tr,
                                  style: CustomTextStyles
                                      .headlineSmallPoppinsBold))),
                      Divider(color: appTheme.black900.withOpacity(0.25)),
                      SizedBox(height: 24.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(right: 20.h),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: 135.v,
                                        width: 141.h,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.h, vertical: 4.v),
                                        decoration: AppDecoration.fillGray5059
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder23),
                                        child: BlocSelector<HomeBloc, HomeState,
                                            bool?>(
                                          selector: (state) =>
                                              state.homeModelObj?.isautoTracked,
                                          builder: (context, isAutoTracked) {
                                            return CustomImageView(
                                              imagePath: isAutoTracked!
                                                  ? ImageConstant
                                                      .imgVectorOff // Si isautoTracked est vrai, afficher imgVectorOff
                                                  : ImageConstant
                                                      .imgVectorOn, // Sinon, afficher imgVectorOn
                                              height: 124.v,
                                              width: 129.h,
                                              alignment: Alignment.center,
                                              onTap: () {
                                                final newHomeModel = context
                                                    .read<HomeBloc>()
                                                    .state
                                                    .homeModelObj
                                                    ?.copyWith(
                                                      isautoTracked:
                                                          !isAutoTracked,
                                                    );
                                                context.read<HomeBloc>().add(
                                                    UpdateHomeModelEvent(
                                                        newHomeModel!));
                                              },
                                            );
                                          },
                                        )),
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgCloseCyan900,
                                        height: 27.v,
                                        width: 84.h,
                                        margin: EdgeInsets.only(
                                            left: 20.h, bottom: 107.v),
                                        onTap: () {
                                          onTapImgClose(context);
                                        })
                                  ]))),
                      SizedBox(height: 14.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 14.h),
                              child: Text("msg_unclassified_trip".tr,
                                  style: CustomTextStyles
                                      .headlineSmallPoppinsBold))),
                      Divider(color: appTheme.black900.withOpacity(0.25)),
                      SizedBox(height: 22.v),
                      _buildFrameNinetyThree(context),
                      SizedBox(height: 21.v),
                      _buildUntripOne(context),
                      SizedBox(height: 22.v),
                      _buildUntripOne1(context)
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 103.v,
        centerTitle: true,
        title: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 11.v),
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
                      margin: EdgeInsets.fromLTRB(290.h, 2.v, 1.h, 2.v),
                      padding: EdgeInsets.symmetric(horizontal: 6.h),
                      decoration: AppDecoration.fillLightGreen.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder9),
                      child: Row(children: [
                        // AppbarSubtitleOne(text: "lbl_127".tr),
                        BlocSelector<HomeBloc, HomeState, String?>(
                            selector: (state) =>
                                state.homeModelObj!.gamingPoints,
                            builder: (context, gamingPoints) {
                              return AppbarSubtitleOne(
                                  text: gamingPoints ?? "lbl_127".tr);
                            }),
                        AppbarImage(
                            imagePath: ImageConstant.imgClose,
                            margin: EdgeInsets.fromLTRB(9.h, 5.v, 5.h, 4.v))
                      ]))
                ])),
        styleType: Style.bgOutline);
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
              style: CustomTextStyles.bodySmallGray50001),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 8.v),
              child: SizedBox(
                  width: 73.h, child: Divider(color: appTheme.gray500)))
        ]);
  }

  /// Section Widget
  Widget _buildUntripOne(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        decoration: AppDecoration.outlineBlack9001
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          _buildTopContainerUnTrip(context,
              sixtyNine: "lbl_6_9".tr,
              kM: "lbl_km2".tr,
              date: "lbl_16_01_2024".tr),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 13.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 9.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("lbl_17_12".tr,
                                          style:
                                              CustomTextStyles.bodyMedium15)),
                                  SizedBox(height: 24.v),
                                  Text("lbl_19_15".tr,
                                      style:
                                          CustomTextStyles.bodyMediumBlack90015)
                                ])),
                        CustomImageView(
                            imagePath: ImageConstant.imgSettings,
                            height: 66.v,
                            width: 21.h,
                            margin: EdgeInsets.only(
                                left: 16.h, top: 2.v, bottom: 12.v)),
                        Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("msg_douala_cameroon".tr,
                                      style: theme.textTheme.labelLarge),
                                  SizedBox(height: 1.v),
                                  Text("msg_entree_lycee_ndogpassi".tr,
                                      style: CustomTextStyles.bodyMediumInter),
                                  SizedBox(height: 14.v),
                                  Text("msg_douala_cameroon".tr,
                                      style: theme.textTheme.labelLarge),
                                  SizedBox(height: 1.v),
                                  Text("msg_entree_lycee_ndogpassi".tr,
                                      style: CustomTextStyles.bodyMediumInter)
                                ]))
                      ]))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.h),
              child: _buildBottomContainer(context))
        ]));
  }

  /// Section Widget
  Widget _buildUntripOne1(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        decoration: AppDecoration.outlineBlack9001
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          _buildTopContainerUnTrip(context,
              sixtyNine: "lbl_6_9".tr,
              kM: "lbl_km2".tr,
              date: "lbl_16_01_2024".tr),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 5.v),
                    child: Column(children: [
                      Text("lbl_17_12".tr,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyMediumBlack90015),
                      SizedBox(height: 24.v),
                      Text("lbl_19_15".tr,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyMediumBlack90015)
                    ])),
                CustomImageView(
                    imagePath: ImageConstant.imgSettings,
                    height: 66.v,
                    width: 21.h,
                    margin: EdgeInsets.only(left: 4.h, top: 2.v, bottom: 7.v)),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: 5.h, top: 2.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("msg_douala_cameroon".tr,
                                  style: theme.textTheme.labelLarge),
                              SizedBox(height: 8.v),
                              Text("msg_entree_lycee_ndogpassi".tr,
                                  style: CustomTextStyles.bodyMediumInter),
                              SizedBox(height: 21.v),
                              Text("msg_douala_cameroon".tr,
                                  style: theme.textTheme.labelLarge),
                              SizedBox(height: 8.v),
                              Text("msg_entree_lycee_ndogpassi".tr,
                                  style: CustomTextStyles.bodyMediumInter)
                            ])))
              ]),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.h),
              child: _buildBottomContainer(context))
        ]));
  }

  /// Common widget
  Widget _buildTopContainerUnTrip(
    BuildContext context, {
    required String sixtyNine,
    required String kM,
    required String date,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(sixtyNine,
          style: CustomTextStyles.titleSmallBold
              .copyWith(color: appTheme.black900)),
      Padding(
          padding: EdgeInsets.only(left: 12.h, top: 2.v, bottom: 3.v),
          child: Text(kM,
              style: CustomTextStyles.bodySmall11
                  .copyWith(color: appTheme.black900))),
      Spacer(flex: 56),
      CustomImageView(
          imagePath: ImageConstant.imgUser, height: 21.v, width: 36.h),
      Spacer(flex: 43),
      Text(date,
          style: CustomTextStyles.bodyMediumBlack90015
              .copyWith(color: appTheme.black900))
    ]);
  }

  /// Common widget
  Widget _buildBottomContainer(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 7.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgLinkedin,
              height: 17.v,
              width: 9.h,
              margin: EdgeInsets.only(top: 1.v)),
          CustomImageView(
              imagePath: ImageConstant.imgCar,
              height: 17.v,
              width: 15.h,
              margin: EdgeInsets.only(left: 17.h, top: 1.v)),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgThumbsUp,
              height: 17.v,
              width: 11.h,
              margin: EdgeInsets.only(top: 1.v))
        ]));
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapLock(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profileScreen,
    );
  }

  /// Navigates to the settingsAutoTrackScreen when the action is triggered.
  onTapImgClose(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsAutoTrackScreen,
    );
  }
}
