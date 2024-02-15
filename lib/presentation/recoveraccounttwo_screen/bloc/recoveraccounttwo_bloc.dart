import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/recoveraccounttwo_screen/models/recoveraccounttwo_model.dart';
import 'package:uclean/data/models/putPassword/put_put_password_resp.dart';
import 'package:uclean/data/models/putPassword/put_put_password_req.dart';
import 'dart:async';
import 'package:uclean/data/repository/repository.dart';
part 'recoveraccounttwo_event.dart';
part 'recoveraccounttwo_state.dart';

/// A bloc that manages the state of a Recoveraccounttwo according to the event that is dispatched to it.
class RecoveraccounttwoBloc
    extends Bloc<RecoveraccounttwoEvent, RecoveraccounttwoState> {
  RecoveraccounttwoBloc(RecoveraccounttwoState initialState)
      : super(initialState) {
    on<RecoveraccounttwoInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
    on<UpdatePasswordEvent>(_callPutPassword);
  }

  final _repository = Repository();

  var putPutPasswordResp = PutPutPasswordResp();

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<RecoveraccounttwoState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<RecoveraccounttwoState> emit,
  ) {
    emit(state.copyWith(isShowPassword1: event.value));
  }

  _onInitialize(
    RecoveraccounttwoInitialEvent event,
    Emitter<RecoveraccounttwoState> emit,
  ) async {
    emit(state.copyWith(
        passwordController: TextEditingController(),
        confirmpasswordController: TextEditingController(),
        isShowPassword: true,
        isShowPassword1: true));
  }

  /// Calls [{{baseUrl}}/user/password] with the provided event and emits the state.
  ///
  /// The [UpdatePasswordEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callPutPassword(
    UpdatePasswordEvent event,
    Emitter<RecoveraccounttwoState> emit,
  ) async {
    var putPutPasswordReq = PutPutPasswordReq(
      password: state.passwordController?.text ?? '',
    );
    await _repository.putPassword(
      headers: {},
      requestData: putPutPasswordReq.toJson(),
    ).then((value) async {
      putPutPasswordResp = value;
      _onPutPasswordSuccess(value, emit);
      event.onUpdatePasswordEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onPutPasswordError();
    });
  }

  void _onPutPasswordSuccess(
    PutPutPasswordResp resp,
    Emitter<RecoveraccounttwoState> emit,
  ) {}
  void _onPutPasswordError() {
    //implement error method body...
  }
}
