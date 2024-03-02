// ignore_for_file: must_be_immutable

part of 'createaccountthree_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Createaccountthree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CreateaccountthreeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Createaccountthree widget is first created.
class CreateaccountthreeInitialEvent extends CreateaccountthreeEvent {
  @override
  List<Object?> get props => [];
}
