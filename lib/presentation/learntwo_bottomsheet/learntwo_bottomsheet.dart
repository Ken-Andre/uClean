import 'bloc/learntwo_bloc.dart';
import 'models/learntwo_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/presentation/home_page/home_page.dart';
import 'package:uclean/presentation/learn_page/learn_page.dart';
import 'package:uclean/presentation/report_page/report_page.dart';
import 'package:uclean/presentation/settings_page/settings_page.dart';
import 'package:uclean/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class LearntwoBottomsheet extends StatelessWidget {
  LearntwoBottomsheet({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<LearntwoBloc>(
      create: (context) => LearntwoBloc(LearntwoState(
        learntwoModelObj: LearntwoModel(),
      ))
        ..add(LearntwoInitialEvent()),
      child: LearntwoBottomsheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(height: 247.v),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 11.v,
              ),
              decoration: AppDecoration.fillPrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL12,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: Text(
                      "msg_the_beauty_of_the".tr,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Container(
                    width: 352.h,
                    margin: EdgeInsets.only(left: 1.h),
                    child: Text(
                      "msg_in_our_journey_towards".tr,
                      maxLines: 28,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(height: 39.v),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
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
