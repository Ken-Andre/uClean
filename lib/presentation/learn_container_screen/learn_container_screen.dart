import 'package:ucleankim/presentation/learn_page/learn_page.dart';
import 'package:ucleankim/presentation/report_page/report_page.dart';
import 'package:ucleankim/presentation/settingspage_page/settingspage_page.dart';
import 'package:ucleankim/widgets/custom_bottom_app_bar.dart';
import 'package:ucleankim/widgets/custom_floating_button.dart';
import 'models/learn_container_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/learn_container_bloc.dart';

// ignore_for_file: must_be_immutable
class LearnContainerScreen extends StatelessWidget {
  LearnContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<LearnContainerBloc>(
        create: (context) => LearnContainerBloc(
            LearnContainerState(learnContainerModelObj: LearnContainerModel()))
          ..add(LearnContainerInitialEvent()),
        child: LearnContainerScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearnContainerBloc, LearnContainerState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Navigator(
                  key: navigatorKey,
                  initialRoute: AppRoutes.learnPage,
                  onGenerateRoute: (routeSetting) => PageRouteBuilder(
                      pageBuilder: (ctx, ani, ani1) =>
                          getCurrentPage(context, routeSetting.name!),
                      transitionDuration: Duration(seconds: 0))),
              bottomNavigationBar: _buildBottomBar(context),
              floatingActionButton: CustomFloatingButton(
                  height: 54,
                  width: 54,
                  backgroundColor: appTheme.blueA400,
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
      case BottomBarEnum.Leftlightgreen200:
        return AppRoutes.learnPage;
      case BottomBarEnum.Statsup:
        return AppRoutes.reportPage;
      case BottomBarEnum.Cogprimary:
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
}
