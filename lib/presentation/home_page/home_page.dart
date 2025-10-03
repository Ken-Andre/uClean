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
            backgroundColor: appTheme.gray10001,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      // Welcome Section
                      Center(
                        child: Column(
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgGroupYellow400,
                                height: 80.v,
                                width: 100.h),
                            SizedBox(height: 16.v),
                            BlocSelector<HomeBloc, HomeState, String?>(
                                selector: (state) =>
                                    state.homeModelObj!.welcomeIsabelle,
                                builder: (context, welcomeIsabelle) {
                                  return Text(welcomeIsabelle ?? "",
                                      style: theme.textTheme.headlineSmall?.copyWith(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ));
                                }),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.v),

                      // Set Live Tracking Section
                      Text("msg_set_live_tracking".tr,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(height: 16.v),
                      _buildTrackingCard(context),
                      SizedBox(height: 32.v),

                      // Unclassified Trips Section
                      Text("msg_unclassified_trip".tr,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(height: 16.v),
                      _buildFrameNinetyThree(context),
                      SizedBox(height: 16.v),
                      _buildUntripOne(context),
                      SizedBox(height: 16.v),
                      _buildUntripOne1(context),
                      SizedBox(height: 16.v),
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 70.v,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => onTapLock(context),
                  child: Container(
                    padding: EdgeInsets.all(8.h),
                    decoration: BoxDecoration(
                      color: appTheme.whiteA70001,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: appTheme.black900.withValues(alpha: 0.08),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgLockBlack900,
                        height: 24.adaptSize,
                        width: 24.adaptSize),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.v),
                    decoration: BoxDecoration(
                      color: appTheme.lightGreen200,
                      borderRadius: BorderRadius.circular(20.h),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BlocSelector<HomeBloc, HomeState, String?>(
                            selector: (state) =>
                                state.homeModelObj!.gamingPoints,
                            builder: (context, gamingPoints) {
                              return Text(
                                gamingPoints ?? "lbl_127".tr,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            }),
                        SizedBox(width: 8.h),
                        CustomImageView(
                            imagePath: ImageConstant.imgClose,
                            height: 20.adaptSize,
                            width: 20.adaptSize)
                    ]))
              ]),
        ));
  }

  /// Modern Tracking Card
  Widget _buildTrackingCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        color: appTheme.whiteA70001,
        borderRadius: BorderRadius.circular(16.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: BlocSelector<HomeBloc, HomeState, bool?>(
              selector: (state) => state.homeModelObj?.isautoTracked,
              builder: (context, isAutoTracked) {
                return GestureDetector(
                  onTap: () {
                    final newHomeModel = context
                        .read<HomeBloc>()
                        .state
                        .homeModelObj
                        ?.copyWith(
                          isautoTracked: !isAutoTracked!,
                        );
                    context.read<HomeBloc>().add(
                        UpdateHomeModelEvent(newHomeModel!));
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.h),
                    decoration: BoxDecoration(
                      color: isAutoTracked! 
                          ? appTheme.cyan800.withValues(alpha: 0.1)
                          : appTheme.gray10001,
                      borderRadius: BorderRadius.circular(12.h),
                    ),
                    child: CustomImageView(
                      imagePath: isAutoTracked
                          ? ImageConstant.imgVectorOff
                          : ImageConstant.imgVectorOn,
                      height: 80.v,
                      width: 80.h,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 16.h),
          GestureDetector(
            onTap: () => onTapImgClose(context),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF003366), Color(0xFF63ACD4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20.h),
              ),
              child: CustomImageView(
                  imagePath: ImageConstant.imgCloseCyan900,
                  height: 24.v,
                  width: 60.h,
                  color: appTheme.whiteA70001),
            ),
          ),
        ],
      ),
    );
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
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: appTheme.whiteA70001,
          borderRadius: BorderRadius.circular(12.h),
          boxShadow: [
            BoxShadow(
              color: appTheme.black900.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // Header with distance and date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("lbl_6_9".tr,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(width: 4.h),
                  Text("lbl_km2".tr,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontFamily: 'Inter',
                      )),
                ],
              ),
              Row(
                children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgUser, height: 20.v, width: 30.h),
                  SizedBox(width: 8.h),
                  Text("lbl_16_01_2024".tr,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Inter',
                      )),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.v),
          // Trip details
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("lbl_17_12".tr,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          )),
                      SizedBox(height: 24.v),
                      Text("lbl_19_15".tr,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ))
                    ]),
                SizedBox(width: 16.h),
                CustomImageView(
                    imagePath: ImageConstant.imgSettings,
                    height: 66.v,
                    width: 21.h),
                SizedBox(width: 8.h),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("msg_douala_cameroon".tr,
                              style: theme.textTheme.labelLarge?.copyWith(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 4.v),
                          Text("msg_entree_lycee_ndogpassi".tr,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontFamily: 'Inter',
                                color: appTheme.black900.withValues(alpha: 0.6),
                              )),
                          SizedBox(height: 16.v),
                          Text("msg_douala_cameroon".tr,
                              style: theme.textTheme.labelLarge?.copyWith(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 4.v),
                          Text("msg_entree_lycee_ndogpassi".tr,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontFamily: 'Inter',
                                color: appTheme.black900.withValues(alpha: 0.6),
                              ))
                        ]))
              ]),
          SizedBox(height: 12.v),
          Divider(color: appTheme.black900.withValues(alpha: 0.1)),
          SizedBox(height: 8.v),
          _buildBottomContainer(context)
        ]));
  }

  /// Section Widget
  Widget _buildUntripOne1(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: appTheme.whiteA70001,
          borderRadius: BorderRadius.circular(12.h),
          boxShadow: [
            BoxShadow(
              color: appTheme.black900.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // Header with distance and date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("lbl_6_9".tr,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(width: 4.h),
                  Text("lbl_km2".tr,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontFamily: 'Inter',
                      )),
                ],
              ),
              Row(
                children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgUser, height: 20.v, width: 30.h),
                  SizedBox(width: 8.h),
                  Text("lbl_16_01_2024".tr,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Inter',
                      )),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.v),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(children: [
                  Text("lbl_17_12".tr,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(height: 24.v),
                  Text("lbl_19_15".tr,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ))
                ]),
                SizedBox(width: 16.h),
                CustomImageView(
                    imagePath: ImageConstant.imgSettings,
                    height: 66.v,
                    width: 21.h),
                SizedBox(width: 8.h),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("msg_douala_cameroon".tr,
                              style: theme.textTheme.labelLarge?.copyWith(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 4.v),
                          Text("msg_entree_lycee_ndogpassi".tr,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontFamily: 'Inter',
                                color: appTheme.black900.withValues(alpha: 0.6),
                              )),
                          SizedBox(height: 16.v),
                          Text("msg_douala_cameroon".tr,
                              style: theme.textTheme.labelLarge?.copyWith(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 4.v),
                          Text("msg_entree_lycee_ndogpassi".tr,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontFamily: 'Inter',
                                color: appTheme.black900.withValues(alpha: 0.6),
                              ))
                        ]))
              ]),
          SizedBox(height: 12.v),
          Divider(color: appTheme.black900.withValues(alpha: 0.1)),
          SizedBox(height: 8.v),
          _buildBottomContainer(context)
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
