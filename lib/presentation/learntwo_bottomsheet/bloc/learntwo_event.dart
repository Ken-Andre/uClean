// ignore_for_file: must_be_immutable

part of 'learntwo_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Learntwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LearntwoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Learntwo widget is first created.
class LearntwoInitialEvent extends LearntwoEvent {
  @override
  List<Object?> get props => [];
}
