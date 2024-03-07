import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/createaccount_screen/models/createaccount_model.dart';
import 'package:ucleankim/data/models/signupPost/post_signup_post_resp.dart';
import 'package:ucleankim/data/models/signupPost/post_signup_post_req.dart';
import 'dart:async';
import 'package:ucleankim/data/repository/repository.dart';
part 'createaccount_event.dart';
part 'createaccount_state.dart';

/// A bloc that manages the state of a Createaccount according to the event that is dispatched to it.
class CreateaccountBloc extends Bloc<CreateaccountEvent, CreateaccountState> {
  CreateaccountBloc(CreateaccountState initialState) : super(initialState) {
    on<CreateaccountInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
    on<CreateSignupEvent>(_callSignupPost);
  }

  final _repository = Repository();

  var postSignupPostResp = PostSignupPostResp();

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<CreateaccountState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<CreateaccountState> emit,
  ) {
    emit(state.copyWith(isShowPassword1: event.value));
  }

  _onInitialize(
    CreateaccountInitialEvent event,
    Emitter<CreateaccountState> emit,
  ) async {
    emit(state.copyWith(
        userNameController: TextEditingController(),
        mailInputController: TextEditingController(),
        passwordController: TextEditingController(),
        confirmpasswordController: TextEditingController(),
        isShowPassword: true,
        isShowPassword1: true));
  }

  /// Calls [https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/signup] with the provided event and emits the state.
  ///
  /// The [CreateSignupEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callSignupPost(
    CreateSignupEvent event,
    Emitter<CreateaccountState> emit,
  ) async {
    var postSignupPostReq = PostSignupPostReq(
      name: state.userNameController?.text ?? '',
      email: state.mailInputController?.text ?? '',
      password: state.passwordController?.text ?? '',
    );

    await _repository.signupPost(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postSignupPostReq.toJson(),
    ).then((value) async {
      postSignupPostResp = value;
      _onSignupPostSuccess(value, emit);
      event.onCreateSignupEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onSignupPostError();
      event.onCreateSignupEventError?.call();
    });
  }

  void _onSignupPostSuccess(
    PostSignupPostResp resp,
    Emitter<CreateaccountState> emit,
  ) {
    // emit(state.copyWith(
    //   authToken: resp.authToken,
    // ));
  }
  void _onSignupPostError() {
    //implement error method body...
  }
}
