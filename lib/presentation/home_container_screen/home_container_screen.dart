import 'bloc/home_container_bloc.dart';
import 'models/home_container_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/presentation/home_page/home_page.dart';
import 'package:uclean/presentation/learn_page/learn_page.dart';
import 'package:uclean/presentation/report_page/report_page.dart';
import 'package:uclean/presentation/settings_page/settings_page.dart';
import 'package:uclean/widgets/custom_bottom_bar.dart';

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
              backgroundColor: appTheme.gray5001,
              body: Navigator(
                  key: navigatorKey,
                  initialRoute: AppRoutes.homePage,
                  onGenerateRoute: (routeSetting) => PageRouteBuilder(
                      pageBuilder: (ctx, ani, ani1) =>
                          getCurrentPage(context, routeSetting.name!),
                      transitionDuration: Duration(seconds: 0))),
              bottomNavigationBar: _buildBottomBar(context)));
    });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Homelightgreen200:
        return AppRoutes.homePage;
      case BottomBarEnum.Vector:
        return AppRoutes.learnPage;
      case BottomBarEnum.Circleplus:
        return "/";
      case BottomBarEnum.Statsup:
        return AppRoutes.reportPage;
      case BottomBarEnum.Cogprimary:
        return AppRoutes.settingsPage;
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
      case AppRoutes.settingsPage:
        return SettingsPage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
