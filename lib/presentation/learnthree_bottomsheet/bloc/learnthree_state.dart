// ignore_for_file: must_be_immutable

part of 'learnthree_bloc.dart';

/// Represents the state of Learnthree in the application.
class LearnthreeState extends Equatable {
  LearnthreeState({this.learnthreeModelObj});

  LearnthreeModel? learnthreeModelObj;

  @override
  List<Object?> get props => [
        learnthreeModelObj,
      ];

  LearnthreeState copyWith({LearnthreeModel? learnthreeModelObj}) {
    return LearnthreeState(
      learnthreeModelObj: learnthreeModelObj ?? this.learnthreeModelObj,
    );
  }
}
