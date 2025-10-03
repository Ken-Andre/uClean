import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Remplacé provider par flutter_bloc
import 'core/app_export.dart';
import 'services/notification_service.dart';
import 'services/step_counter_service.dart';
import 'services/wifi_tracking_service.dart';
import 'services/tracking_controller.dart'; // Contient maintenant TrackingBloc

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Initialisation des services singletons
  await PrefUtils().init();
  await NotificationService.instance.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        // [CORRIGÉ] Utilisation de MultiBlocProvider pour une architecture BLoC pure.
        return MultiBlocProvider(
          providers: [
            BlocProvider<ThemeBloc>(
              create: (context) => ThemeBloc(
                ThemeState(themeType: PrefUtils().getThemeData()),
              ),
            ),
            BlocProvider<TrackingBloc>(
              create: (context) {
                // Crée et démarre le TrackingBloc
                final bloc = TrackingBloc(
                  isTracking:
                      false, // L'état initial sera géré par le bloc lui-même
                  stepCounter: StepCounterService.instance,
                  wifiTracking: WifiTrackingService.instance,
                  notificationService: NotificationService.instance,
                );
                // Ajoute l'événement pour démarrer le tracking
                bloc.add(StartTracking());
                print('✅ TrackingBloc démarré depuis main.dart');
                return bloc;
              },
              lazy: false, // Assure que le bloc est créé immédiatement
            ),
          ],
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
                  Locale('en', ''),
                ],
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
//TODO [Map_Dialog_Location]https://www.dhiwise.com/post/elevate-your-app-with-flutter-osm-plugin
