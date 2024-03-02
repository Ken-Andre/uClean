// ignore_for_file: must_be_immutable

part of 'learn_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///LearnContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LearnContainerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the LearnContainer widget is first created.
class LearnContainerInitialEvent extends LearnContainerEvent {
  @override
  List<Object?> get props => [];
}
