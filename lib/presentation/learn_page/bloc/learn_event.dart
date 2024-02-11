// ignore_for_file: must_be_immutable

part of 'learn_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Learn widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LearnEvent extends Equatable {}

/// Event that is dispatched when the Learn widget is first created.
class LearnInitialEvent extends LearnEvent {
  @override
  List<Object?> get props => [];
}
