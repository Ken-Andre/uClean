import 'models/app_navigation_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/app_navigation_bloc.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(AppNavigationState(
        appNavigationModelObj: AppNavigationModel(),
      ))
        ..add(AppNavigationInitialEvent()),
      child: AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0XFFFFFFFF),
            body: SizedBox(
              width: 375.h,
              child: Column(
                children: [
                  _buildAppNavigation(context),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                        ),
                        child: Column(
                          children: [
                            _buildScreenTitle(
                              context,
                              screenTitle: "Splash".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.splashScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Settings AddManualTripPResVers".tr,
                              onTapScreenTitle: () => onTapScreenTitle(AppRoutes
                                  .settingsAddmanualtrippresversScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "NotifsPanel".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.notifspanelScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Profile".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.profileScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "RecoverAccountTwo".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.recoveraccounttwoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "RecoverAccount".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.recoveraccountScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Settings AddManualTripP".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.settingsAddmanualtrippScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Settings Auto-Track".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.settingsAutoTrackScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Settings ContactUs".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.settingsContactusScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Login".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.loginScreen),
                            ),
                            // _buildScreenTitle(
                            //   context,
                            //   screenTitle: "Home".tr,
                            //   onTapScreenTitle: () =>
                            //       onTapScreenTitle(AppRoutes.homeScreen),
                            // ),
                            // _buildScreenTitle(
                            //   context,
                            //   screenTitle: "Learn - Container".tr,
                            //   onTapScreenTitle: () => onTapScreenTitle(
                            //       AppRoutes.learnContainerScreen),
                            // ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Learn - Container".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                AppRoutes.homeContainerScreen,),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "CreateAccount".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.createaccountScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "CreateAccountTwo".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.createaccounttwoScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "CreateAccountThree".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.createaccountthreeScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Onboarding".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.onboardingScreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: FontsConstant.Roboto,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: FontsConstant.Roboto,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: FontsConstant.Roboto,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
