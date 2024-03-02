// ignore_for_file: must_be_immutable

part of 'learnfour_bloc.dart';

/// Represents the state of Learnfour in the application.
class LearnfourState extends Equatable {
  LearnfourState({this.learnfourModelObj});

  LearnfourModel? learnfourModelObj;

  @override
  List<Object?> get props => [
        learnfourModelObj,
      ];

  LearnfourState copyWith({LearnfourModel? learnfourModelObj}) {
    return LearnfourState(
      learnfourModelObj: learnfourModelObj ?? this.learnfourModelObj,
    );
  }
}
