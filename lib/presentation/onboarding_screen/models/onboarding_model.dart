// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [onboarding_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingModel extends Equatable {
  OnboardingModel({
    this.page = 0,
}) {}
  int? page;

  OnboardingModel copyWith({
    int? page,
}) {
    return OnboardingModel(
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [page];
}
