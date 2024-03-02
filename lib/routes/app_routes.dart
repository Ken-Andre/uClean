import 'package:flutter/material.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/settings_addmanualtrippresvers_screen/settings_addmanualtrippresvers_screen.dart';
import '../presentation/notifspanel_screen/notifspanel_screen.dart';
import '../presentation/profile_screen/profile_screen.dart';
import '../presentation/recoveraccounttwo_screen/recoveraccounttwo_screen.dart';
import '../presentation/recoveraccount_screen/recoveraccount_screen.dart';
import '../presentation/settings_addmanualtripp_screen/settings_addmanualtripp_screen.dart';
import '../presentation/settings_auto_track_screen/settings_auto_track_screen.dart';
import '../presentation/settings_contactus_screen/settings_contactus_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/learn_container_screen/learn_container_screen.dart';
import '../presentation/createaccount_screen/createaccount_screen.dart';
import '../presentation/createaccounttwo_screen/createaccounttwo_screen.dart';
import '../presentation/createaccountthree_screen/createaccountthree_screen.dart';
import '../presentation/onboarding_screen/onboarding_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

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

  static const String settingspagePage = '/settingspage_page';

  static const String settingsAutoTrackScreen = '/settings_auto_track_screen';

  static const String settingsContactusScreen = '/settings_contactus_screen';

  static const String loginScreen = '/login_screen';

  static const String homeScreen = '/home_screen';

  static const String learnContainerScreen = '/learn_container_screen';

  static const String learnPage = '/learn_page';

  static const String createaccountScreen = '/createaccount_screen';

  static const String createaccounttwoScreen = '/createaccounttwo_screen';

  static const String createaccountthreeScreen = '/createaccountthree_screen';

  static const String reportPage = '/report_page';

  static const String onboardingScreen = '/onboarding_screen';

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
        settingsAutoTrackScreen: SettingsAutoTrackScreen.builder,
        settingsContactusScreen: SettingsContactusScreen.builder,
        loginScreen: LoginScreen.builder,
        homeScreen: HomeScreen.builder,
        learnContainerScreen: LearnContainerScreen.builder,
        createaccountScreen: CreateaccountScreen.builder,
        createaccounttwoScreen: CreateaccounttwoScreen.builder,
        createaccountthreeScreen: CreateaccountthreeScreen.builder,
        onboardingScreen: OnboardingScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
