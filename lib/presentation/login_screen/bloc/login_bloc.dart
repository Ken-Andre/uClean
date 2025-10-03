import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/login_screen/models/login_model.dart';
import 'package:ucleankim/data/models/authLoginPost/post_auth_login_post_resp.dart';
import 'package:ucleankim/data/models/authLoginPost/post_auth_login_post_req.dart';
import 'dart:async';
import 'package:ucleankim/data/repository/repository.dart';
import 'package:ucleankim/core/errors/error_handler.dart';
import 'package:dio/dio.dart';
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
    // Clear any previous error and start loading
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
    ));

    try {
      var postAuthLoginPostReq = PostAuthLoginPostReq(
        email: state.emailController?.text ?? '',
        password: state.passwordController?.text ?? '',
      );

      final response = await _repository.authLoginPost(
        headers: {
          'Content-type': 'application/json',
        },
        requestData: postAuthLoginPostReq.toJson(),
      );

      postAuthLoginPostResp = response;
      _onAuthLoginPostSuccess(response, emit);
      event.onCreateLoginEventSuccess?.call();

    } catch (error, stackTrace) {
      // Handle error using the ErrorHandler
      final userFriendlyMessage = _getUserFriendlyErrorMessage(error);
      _onAuthLoginPostError(error, userFriendlyMessage, emit);
      event.onCreateLoginEventError?.call();

      // Log the error for debugging
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
    }
  }

  void _onAuthLoginPostSuccess(
    PostAuthLoginPostResp resp,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      isLoading: false,
      isLoggedIn: true,
      errorMessage: null,
    ));
  }

  void _onAuthLoginPostError(dynamic error, String userMessage, Emitter<LoginState> emit) {
    emit(state.copyWith(
      isLoading: false,
      errorMessage: userMessage,
      isLoggedIn: false,
    ));
  }

  /// Converts technical errors to user-friendly messages
  String _getUserFriendlyErrorMessage(dynamic error) {
    if (error is DioError) {
      final exception = ErrorHandler.handle(error);
      return ErrorHandler.getErrorMessage(exception);
    }

    // Handle other types of errors
    if (error is Exception) {
      return ErrorHandler.getErrorMessage(error);
    }

    return 'An unexpected error occurred. Please try again.';
  }
}
