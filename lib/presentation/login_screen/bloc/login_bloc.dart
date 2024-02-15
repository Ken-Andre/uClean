import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/login_screen/models/login_model.dart';
import 'package:uclean/data/models/postUserLogin/post_post_user_login_resp.dart';
import 'package:uclean/data/models/postUserLogin/post_post_user_login_req.dart';
import 'dart:async';
import 'package:uclean/data/repository/repository.dart';
part 'login_event.dart';
part 'login_state.dart';

/// A bloc that manages the state of a Login according to the event that is dispatched to it.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState) {
    on<LoginInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<CreateLoginEvent>(_callPostUserLogin);
  }

  final _repository = Repository();

  var postPostUserLoginResp = PostPostUserLoginResp();

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

  /// Calls [{{baseUrl}}/user/login] with the provided event and emits the state.
  ///
  /// The [CreateLoginEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callPostUserLogin(
    CreateLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    var postPostUserLoginReq = PostPostUserLoginReq(
      email: state.emailController?.text ?? '',
      password: state.passwordController?.text ?? '',
    );
    await _repository.postUserLogin(
      headers: {},
      requestData: postPostUserLoginReq.toJson(),
    ).then((value) async {
      postPostUserLoginResp = value;
      _onPostUserLoginSuccess(value, emit);
      event.onCreateLoginEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onPostUserLoginError();
      event.onCreateLoginEventError?.call();
    });
  }

  void _onPostUserLoginSuccess(
    PostPostUserLoginResp resp,
    Emitter<LoginState> emit,
  ) {}
  void _onPostUserLoginError() {
    //implement error method body...
  }
}
