import 'package:flutter/material.dart';
import 'package:uclean/presentation/splash_screen/splash_screen.dart';
import 'package:uclean/presentation/settings_addmanualtrippresvers_screen/settings_addmanualtrippresvers_screen.dart';
import 'package:uclean/presentation/notifspanel_screen/notifspanel_screen.dart';
import 'package:uclean/presentation/profile_screen/profile_screen.dart';
import 'package:uclean/presentation/recoveraccounttwo_screen/recoveraccounttwo_screen.dart';
import 'package:uclean/presentation/recoveraccount_screen/recoveraccount_screen.dart';
import 'package:uclean/presentation/settings_addmanualtripp_screen/settings_addmanualtripp_screen.dart';
import 'package:uclean/presentation/settingsautotrack_screen/settingsautotrack_screen.dart';
import 'package:uclean/presentation/login_screen/login_screen.dart';
import 'package:uclean/presentation/login_three_screen/login_three_screen.dart';
import 'package:uclean/presentation/home_container_screen/home_container_screen.dart';
import 'package:uclean/presentation/createaccount_screen/createaccount_screen.dart';
import 'package:uclean/presentation/createaccounttwo_screen/createaccounttwo_screen.dart';
import 'package:uclean/presentation/createaccountthree_screen/createaccountthree_screen.dart';
import 'package:uclean/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String settingsAddmanualtrippresversScreen =
      '/settings_addmanualtrippresvers_screen';

  static const String notifspanelScreen = '/notifspanel_screen';

  static const String profileScreen = '/profile_screen';

  static const String recoveraccounttwoScreen = '/recoveraccounttwo_screen';

  static const String recoveraccountScreen = '/recoveraccount_screen';

  static const String settingsAddmanualtrippScreen =
      '/settings_addmanualtripp_screen';

  static const String settingsPage = '/settings_page';

  static const String settingsautotrackScreen = '/settingsautotrack_screen';

  static const String loginScreen = '/login_screen';

  static const String loginThreeScreen = '/login_three_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String learnPage = '/learn_page';

  static const String createaccountScreen = '/createaccount_screen';

  static const String createaccounttwoScreen = '/createaccounttwo_screen';

  static const String createaccountthreeScreen = '/createaccountthree_screen';

  static const String reportPage = '/report_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        settingsAddmanualtrippresversScreen:
            SettingsAddmanualtrippresversScreen.builder,
        notifspanelScreen: NotifspanelScreen.builder,
        profileScreen: ProfileScreen.builder,
        recoveraccounttwoScreen: RecoveraccounttwoScreen.builder,
        recoveraccountScreen: RecoveraccountScreen.builder,
        settingsAddmanualtrippScreen: SettingsAddmanualtrippScreen.builder,
        settingsautotrackScreen: SettingsautotrackScreen.builder,
        loginScreen: LoginScreen.builder,
        loginThreeScreen: LoginThreeScreen.builder,
        homeContainerScreen: HomeContainerScreen.builder,
        createaccountScreen: CreateaccountScreen.builder,
        createaccounttwoScreen: CreateaccounttwoScreen.builder,
        createaccountthreeScreen: CreateaccountthreeScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
