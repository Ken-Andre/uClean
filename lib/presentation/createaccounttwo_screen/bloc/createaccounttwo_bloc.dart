import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/createaccounttwo_screen/models/createaccounttwo_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:uclean/data/models/postForgotPasswordToken/post_post_forgot_password_token_resp.dart';
import 'package:uclean/data/models/postForgotPasswordToken/post_post_forgot_password_token_req.dart';
import 'dart:async';
import 'package:uclean/data/repository/repository.dart';
part 'createaccounttwo_event.dart';
part 'createaccounttwo_state.dart';

/// A bloc that manages the state of a Createaccounttwo according to the event that is dispatched to it.
class CreateaccounttwoBloc
    extends Bloc<CreateaccounttwoEvent, CreateaccounttwoState>
    with CodeAutoFill {
  CreateaccounttwoBloc(CreateaccounttwoState initialState)
      : super(initialState) {
    on<CreateaccounttwoInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
    on<CreateForgotPasswordTokenEvent>(_callPostForgotPasswordToken);
  }

  final _repository = Repository();

  var postPostForgotPasswordTokenResp = PostPostForgotPasswordTokenResp();

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<CreateaccounttwoState> emit,
  ) {
    emit(
        state.copyWith(otpController: TextEditingController(text: event.code)));
  }

  _onInitialize(
    CreateaccounttwoInitialEvent event,
    Emitter<CreateaccounttwoState> emit,
  ) async {
    emit(state.copyWith(otpController: TextEditingController()));
    listenForCode();
  }

  /// Calls [{{baseUrl}}/user/forgot-password-token] with the provided event and emits the state.
  ///
  /// The [CreateForgotPasswordTokenEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callPostForgotPasswordToken(
    CreateForgotPasswordTokenEvent event,
    Emitter<CreateaccounttwoState> emit,
  ) async {
    var postPostForgotPasswordTokenReq = PostPostForgotPasswordTokenReq();
    await _repository.postForgotPasswordToken(
      headers: {},
      requestData: postPostForgotPasswordTokenReq.toJson(),
    ).then((value) async {
      postPostForgotPasswordTokenResp = value;
      _onPostForgotPasswordTokenSuccess(value, emit);
      event.onCreateForgotPasswordTokenEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onPostForgotPasswordTokenError();
      event.onCreateForgotPasswordTokenEventError?.call();
    });
  }

  void _onPostForgotPasswordTokenSuccess(
    PostPostForgotPasswordTokenResp resp,
    Emitter<CreateaccounttwoState> emit,
  ) {}
  void _onPostForgotPasswordTokenError() {
    //implement error method body...
  }
}
