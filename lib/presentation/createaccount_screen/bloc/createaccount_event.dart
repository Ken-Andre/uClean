// ignore_for_file: must_be_immutable

part of 'createaccount_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Createaccount widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CreateaccountEvent extends Equatable {}

/// Event that is dispatched when the Createaccount widget is first created.
class CreateaccountInitialEvent extends CreateaccountEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the {{baseUrl}}/user/register API.
class CreateRegisterEvent extends CreateaccountEvent {
  CreateRegisterEvent({
    this.onCreateRegisterEventSuccess,
    this.onCreateRegisterEventError,
  });

  Function? onCreateRegisterEventSuccess;

  Function? onCreateRegisterEventError;

  @override
  List<Object?> get props => [
        onCreateRegisterEventSuccess,
        onCreateRegisterEventError,
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

///Event for changing checkbox
class ChangeCheckBoxEvent extends CreateaccountEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
