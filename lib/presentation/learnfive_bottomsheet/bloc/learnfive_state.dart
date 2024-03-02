// ignore_for_file: must_be_immutable

part of 'learnfive_bloc.dart';

/// Represents the state of Learnfive in the application.
class LearnfiveState extends Equatable {
  LearnfiveState({this.learnfiveModelObj});

  LearnfiveModel? learnfiveModelObj;

  @override
  List<Object?> get props => [
        learnfiveModelObj,
      ];

  LearnfiveState copyWith({LearnfiveModel? learnfiveModelObj}) {
    return LearnfiveState(
      learnfiveModelObj: learnfiveModelObj ?? this.learnfiveModelObj,
    );
  }
}
