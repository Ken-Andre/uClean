import 'package:ucleankim/presentation/home_page/home_page.dart';
import 'package:ucleankim/presentation/learn_page/learn_page.dart';
import 'package:ucleankim/presentation/report_page/report_page.dart';
import 'package:ucleankim/presentation/settingspage_page/settingspage_page.dart';
import 'package:ucleankim/widgets/custom_bottom_app_bar.dart';
import 'package:ucleankim/widgets/custom_floating_button.dart';
import 'models/home_container_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/home_container_bloc.dart';

// ignore_for_file: must_be_immutable

class HomeContainerScreen extends StatelessWidget {
  HomeContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeContainerBloc>(
        create: (context) => HomeContainerBloc(
            HomeContainerState(homeContainerModelObj: HomeContainerModel()))
          ..add(HomeContainerInitialEvent()),
        child: HomeContainerScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeContainerBloc, HomeContainerState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Navigator(
                  key: navigatorKey,
                  initialRoute: AppRoutes.homePage,
                  onGenerateRoute: (routeSetting) => PageRouteBuilder(
                      pageBuilder: (ctx, ani, ani1) =>
                          getCurrentPage(context, routeSetting.name!),
                      transitionDuration: Duration(seconds: 0))),
              bottomNavigationBar: _buildBottomBar(context),
              floatingActionButton: CustomFloatingButton(
                  height: 50,
                  width: 50,
                  backgroundColor: appTheme.blueA400,
                  onTap: () {
                    navigatetoAddScreen(context);
                  },
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCirclePlus,
                      height: 27.0.v,
                      width: 27.0.h)),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked));
    });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Userbluegray900:
        return AppRoutes.homePage;
      case BottomBarEnum.Contrastgray60001:
        return AppRoutes.learnPage;
      // case BottomBarEnum.Television:
      //   return "/";
      case BottomBarEnum.Vector:
        return AppRoutes.reportPage;
      case BottomBarEnum.Lockgray60001:
        return AppRoutes.settingspagePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage.builder(context);
      case AppRoutes.learnPage:
        return LearnPage.builder(context);
      case AppRoutes.reportPage:
        return ReportPage.builder(context);
      case AppRoutes.settingspagePage:
        return SettingspagePage.builder(context);
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the settingsAddmanualtrippresversScreen when the action is triggered.
  navigatetoAddScreen(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsAddmanualtrippresversScreen,
    );
  }
}
