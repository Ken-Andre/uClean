import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/login_screen/models/login_model.dart';
import 'package:ucleankim/data/models/authLoginPost/post_auth_login_post_resp.dart';
import 'package:ucleankim/data/models/authLoginPost/post_auth_login_post_req.dart';
import 'dart:async';
import 'package:ucleankim/data/repository/repository.dart';
part 'login_event.dart';
part 'login_state.dart';

/// A bloc that manages the state of a Login according to the event that is dispatched to it.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState) {
    on<LoginInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<CreateLoginEvent>(_callAuthLoginPost);
  }

  final _repository = Repository();

  var postAuthLoginPostResp = PostAuthLoginPostResp();

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _onInitialize(
    LoginInitialEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        isShowPassword: true));
  }

  /// Calls [https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/login] with the provided event and emits the state.
  ///
  /// The [CreateLoginEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callAuthLoginPost(
    CreateLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    var postAuthLoginPostReq = PostAuthLoginPostReq(
      email: state.emailController?.text ?? '',
      password: state.passwordController?.text ?? '',
    );
    await _repository.authLoginPost(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postAuthLoginPostReq.toJson(),
    ).then((value) async {
      postAuthLoginPostResp = value;
      _onAuthLoginPostSuccess(value, emit);
      event.onCreateLoginEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onAuthLoginPostError();
      event.onCreateLoginEventError?.call();
    });
  }

  void _onAuthLoginPostSuccess(
    PostAuthLoginPostResp resp,
    Emitter<LoginState> emit,
  ) {}
  void _onAuthLoginPostError() {
    //implement error method body...
  }
}
