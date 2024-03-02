// ignore_for_file: must_be_immutable

part of 'learnthree_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Learnthree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LearnthreeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Learnthree widget is first created.
class LearnthreeInitialEvent extends LearnthreeEvent {
  @override
  List<Object?> get props => [];
}
