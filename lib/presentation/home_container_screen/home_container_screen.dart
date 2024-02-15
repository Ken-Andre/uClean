import 'bloc/home_container_bloc.dart';
import 'models/home_container_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/presentation/home_page/home_page.dart';
import 'package:uclean/presentation/report_page/report_page.dart';
import 'package:uclean/presentation/settings_page/settings_page.dart';
import 'package:uclean/widgets/custom_bottom_app_bar.dart';
import 'package:uclean/widgets/custom_floating_button.dart';

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
              bottomNavigationBar: _buildBottomNavApp(context),
              floatingActionButton: CustomFloatingButton(
                  height: 54,
                  width: 54,
                  backgroundColor: appTheme.indigoA700,
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCirclePlusPrimary,
                      height: 27.0.v,
                      width: 27.0.h)),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked));
    });
  }

  /// Section Widget
  Widget _buildBottomNavApp(BuildContext context) {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Leftprimary:
        return AppRoutes.homePage;
      case BottomBarEnum.Statsupprimary:
        return AppRoutes.reportPage;
      case BottomBarEnum.Cogprimary1:
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
      case AppRoutes.reportPage:
        return ReportPage.builder(context);
      case AppRoutes.settingsPage:
        return SettingsPage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
