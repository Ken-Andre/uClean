// ignore_for_file: must_be_immutable

part of 'createaccount_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Createaccount widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CreateaccountEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Createaccount widget is first created.
class CreateaccountInitialEvent extends CreateaccountEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/signup API.
class CreateSignupEvent extends CreateaccountEvent {
  CreateSignupEvent({
    this.onCreateSignupEventSuccess,
    this.onCreateSignupEventError,
  });

  Function? onCreateSignupEventSuccess;

  Function? onCreateSignupEventError;

  @override
  List<Object?> get props => [
        onCreateSignupEventSuccess,
        onCreateSignupEventError,
      ];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends CreateaccountEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent1 extends CreateaccountEvent {
  ChangePasswordVisibilityEvent1({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
