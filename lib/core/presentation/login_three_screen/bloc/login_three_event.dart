// ignore_for_file: must_be_immutable

part of 'login_three_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///LoginThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LoginThreeEvent extends Equatable {}

/// Event that is dispatched when the LoginThree widget is first created.
class LoginThreeInitialEvent extends LoginThreeEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends LoginThreeEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
