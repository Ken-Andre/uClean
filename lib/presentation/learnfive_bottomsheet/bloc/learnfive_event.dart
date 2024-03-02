// ignore_for_file: must_be_immutable

part of 'learnfive_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Learnfive widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LearnfiveEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Learnfive widget is first created.
class LearnfiveInitialEvent extends LearnfiveEvent {
  @override
  List<Object?> get props => [];
}
