import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/recoveraccount_screen/models/recoveraccount_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:uclean/data/models/putResetPasswordToken/put_put_reset_password_token_resp.dart';
import 'package:uclean/data/models/putResetPasswordToken/put_put_reset_password_token_req.dart';
import 'dart:async';
import 'package:uclean/data/repository/repository.dart';
part 'recoveraccount_event.dart';
part 'recoveraccount_state.dart';

/// A bloc that manages the state of a Recoveraccount according to the event that is dispatched to it.
class RecoveraccountBloc extends Bloc<RecoveraccountEvent, RecoveraccountState>
    with CodeAutoFill {
  RecoveraccountBloc(RecoveraccountState initialState) : super(initialState) {
    on<RecoveraccountInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
    on<UpdateTokenEvent>(_callPutResetPasswordToken);
  }

  final _repository = Repository();

  var putPutResetPasswordTokenResp = PutPutResetPasswordTokenResp();

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<RecoveraccountState> emit,
  ) {
    emit(
        state.copyWith(otpController: TextEditingController(text: event.code)));
  }

  _onInitialize(
    RecoveraccountInitialEvent event,
    Emitter<RecoveraccountState> emit,
  ) async {
    emit(state.copyWith(otpController: TextEditingController()));
    listenForCode();
  }

  /// Calls [{{baseUrl}}/user/reset-password/{token}] with the provided event and emits the state.
  ///
  /// The [UpdateTokenEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callPutResetPasswordToken(
    UpdateTokenEvent event,
    Emitter<RecoveraccountState> emit,
  ) async {
    var putPutResetPasswordTokenReq = PutPutResetPasswordTokenReq();
    await _repository.putResetPasswordToken(
      headers: {},
      requestData: putPutResetPasswordTokenReq.toJson(),
    ).then((value) async {
      putPutResetPasswordTokenResp = value;
      _onPutResetPasswordTokenSuccess(value, emit);
      event.onUpdateTokenEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onPutResetPasswordTokenError();
    });
  }

  void _onPutResetPasswordTokenSuccess(
    PutPutResetPasswordTokenResp resp,
    Emitter<RecoveraccountState> emit,
  ) {}
  void _onPutResetPasswordTokenError() {
    //implement error method body...
  }
}
