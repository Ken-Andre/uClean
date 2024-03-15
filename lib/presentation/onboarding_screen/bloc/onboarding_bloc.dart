import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/onboarding_screen/models/onboarding_model.dart';
part 'onboarding_event.dart';
part 'onboarding_state.dart';

/// A bloc that manages the state of a Onboarding according to the event that is dispatched to it.
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc(OnboardingState initialState) : super(initialState) {
    on<OnboardingInitialEvent>(_onInitialize);
    on<UpdatePageViewEvent>(_updatePageView);
  }

  _onInitialize(
    OnboardingInitialEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(
      pageController: PageController(),
    ));
    print("Onboarding _onInitialize done.");
  }

  _updatePageView(
      UpdatePageViewEvent event, Emitter<OnboardingState> emit) async {
    // final updatedState = state.copyWith(onboardingModelObj: state.onboardingModelObj?.copyWith(page: event.page);
    emit(state.copyWith(activePage: event.page));
  }
}
