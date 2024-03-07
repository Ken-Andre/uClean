import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (context) => ThemeBloc(
            ThemeState(
              themeType: PrefUtils().getThemeData(),
            ),
          ),
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                theme: theme,
                title: 'ucleankim',
                navigatorKey: NavigatorService.navigatorKey,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale(
                    'en',
                    '',
                  ),
                ],
                //initialRoute: AppRoutes.initialRoute,
                initialRoute: AppRoutes.appNavigationScreen,
                routes: AppRoutes.routes,
              );
            },
          ),
        );
      },
    );
  }
}

///TODO CustomBar to modify;--Done
//TODO Responsive Learn Container;
//TODO Responsive BottomSheet;
//TODO Resolve the BottomSheet 5 for closing ; --SemiDone
//TODO Trip
//TODO Get Trips; Post Logout and sync with SharedPrefs; Login And Signup in SharedPrefs;
//TODO HomePage(done) and SettingsPage from ucleankim test_kyan; WidgetContainer too.