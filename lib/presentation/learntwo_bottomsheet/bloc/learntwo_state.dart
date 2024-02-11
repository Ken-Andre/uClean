// ignore_for_file: must_be_immutable

part of 'learntwo_bloc.dart';

/// Represents the state of Learntwo in the application.
class LearntwoState extends Equatable {
  LearntwoState({this.learntwoModelObj});

  LearntwoModel? learntwoModelObj;

  @override
  List<Object?> get props => [
        learntwoModelObj,
      ];
  LearntwoState copyWith({LearntwoModel? learntwoModelObj}) {
    return LearntwoState(
      learntwoModelObj: learntwoModelObj ?? this.learntwoModelObj,
    );
  }
}
