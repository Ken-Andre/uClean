// ignore_for_file: must_be_immutable

part of 'onboarding_bloc.dart';

/// Represents the state of Onboarding in the application.
class OnboardingState extends Equatable {
  OnboardingState({
    this.pageController,
    this.onboardingModelObj,
    this.activePage = 0,
  });

  PageController? pageController;

  OnboardingModel? onboardingModelObj;

  int? activePage;

  @override
  List<Object?> get props => [
    pageController,
    onboardingModelObj,
    activePage,
  ];

  OnboardingState copyWith({
    PageController? pageController,
    OnboardingModel? onboardingModelObj,
    int? activePage,
  }) {
    return OnboardingState(
      pageController: pageController ?? this.pageController,
      onboardingModelObj: onboardingModelObj ?? this.onboardingModelObj,
      activePage: activePage ?? this.activePage,
    );
  }
}
