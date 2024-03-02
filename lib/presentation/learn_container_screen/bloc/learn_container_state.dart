// ignore_for_file: must_be_immutable

part of 'learn_container_bloc.dart';

/// Represents the state of LearnContainer in the application.
class LearnContainerState extends Equatable {
  LearnContainerState({this.learnContainerModelObj});

  LearnContainerModel? learnContainerModelObj;

  @override
  List<Object?> get props => [
        learnContainerModelObj,
      ];

  LearnContainerState copyWith({LearnContainerModel? learnContainerModelObj}) {
    return LearnContainerState(
      learnContainerModelObj:
          learnContainerModelObj ?? this.learnContainerModelObj,
    );
  }
}
