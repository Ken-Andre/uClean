// ignore_for_file: must_be_immutable

part of 'recoveraccounttwo_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Recoveraccounttwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RecoveraccounttwoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Recoveraccounttwo widget is first created.
class RecoveraccounttwoInitialEvent extends RecoveraccounttwoEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends RecoveraccounttwoEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent1 extends RecoveraccounttwoEvent {
  ChangePasswordVisibilityEvent1({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
