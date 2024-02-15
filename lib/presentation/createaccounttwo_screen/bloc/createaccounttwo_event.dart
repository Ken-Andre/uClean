// ignore_for_file: must_be_immutable

part of 'createaccounttwo_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Createaccounttwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CreateaccounttwoEvent extends Equatable {}

/// Event that is dispatched when the Createaccounttwo widget is first created.
class CreateaccounttwoInitialEvent extends CreateaccounttwoEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the {{baseUrl}}/user/forgot-password-token API.
class CreateForgotPasswordTokenEvent extends CreateaccounttwoEvent {
  CreateForgotPasswordTokenEvent({
    this.onCreateForgotPasswordTokenEventSuccess,
    this.onCreateForgotPasswordTokenEventError,
  });

  Function? onCreateForgotPasswordTokenEventSuccess;

  Function? onCreateForgotPasswordTokenEventError;

  @override
  List<Object?> get props => [
        onCreateForgotPasswordTokenEventSuccess,
        onCreateForgotPasswordTokenEventError,
      ];
}

///event for OTP auto fill
class ChangeOTPEvent extends CreateaccounttwoEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
