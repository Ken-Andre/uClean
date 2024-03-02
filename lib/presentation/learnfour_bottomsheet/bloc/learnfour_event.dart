// ignore_for_file: must_be_immutable

part of 'learnfour_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Learnfour widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LearnfourEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Learnfour widget is first created.
class LearnfourInitialEvent extends LearnfourEvent {
  @override
  List<Object?> get props => [];
}
