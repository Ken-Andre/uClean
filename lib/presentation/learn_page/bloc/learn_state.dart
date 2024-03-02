// ignore_for_file: must_be_immutable

part of 'learn_bloc.dart';

/// Represents the state of Learn in the application.
class LearnState extends Equatable {
  LearnState({this.learnModelObj});

  LearnModel? learnModelObj;

  @override
  List<Object?> get props => [
        learnModelObj,
      ];

  LearnState copyWith({LearnModel? learnModelObj}) {
    return LearnState(
      learnModelObj: learnModelObj ?? this.learnModelObj,
    );
  }
}
