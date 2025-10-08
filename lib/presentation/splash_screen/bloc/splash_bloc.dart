import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/splash_screen/models/splash_model.dart';
part 'splash_event.dart';
part 'splash_state.dart';

/// A bloc that manages the state of a Splash according to the event that is dispatched to it.
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(SplashState initialState) : super(initialState) {
    on<SplashInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SplashInitialEvent event,
    Emitter<SplashState> emit,
  ) async {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      final prefUtils = PrefUtils();
      await prefUtils.init();

      // Vérifier si l'onboarding a été complété
      if (!prefUtils.getOnboardingCompleted()) {
        // Première fois - aller à l'onboarding
        NavigatorService.popAndPushNamed(
          AppRoutes.onboardingScreen,
        );
      } else {
        // Onboarding fait - vérifier l'authentification
        if (prefUtils.isLoggedIn()) {
          // Déjà connecté - aller au home
          NavigatorService.popAndPushNamed(
            AppRoutes.homeContainerScreen,
          );
        } else {
          // Pas connecté - aller au login
          NavigatorService.popAndPushNamed(
            AppRoutes.loginScreen,
          );
        }
      }
    });
  }
}
