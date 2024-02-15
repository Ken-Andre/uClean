import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/createaccount_screen/models/createaccount_model.dart';
import 'package:uclean/data/models/postRegister/post_post_register_resp.dart';
import 'package:uclean/data/models/postRegister/post_post_register_req.dart';
import 'dart:async';
import 'package:uclean/data/repository/repository.dart';
import 'package:uclean/core/constants/Types.dart';
part 'createaccount_event.dart';
part 'createaccount_state.dart';

/// A bloc that manages the state of a Createaccount according to the event that is dispatched to it.
class CreateaccountBloc extends Bloc<CreateaccountEvent, CreateaccountState> {
  CreateaccountBloc(CreateaccountState initialState) : super(initialState) {
    on<CreateaccountInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<CreateRegisterEvent>(_callPostRegister);
  }

  final _repository = Repository();

  var postPostRegisterResp = PostPostRegisterResp();

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

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<CreateaccountState> emit,
  ) {
    emit(state.copyWith(acceptAllTermsAndConditions: event.value));
  }

  _onInitialize(
    CreateaccountInitialEvent event,
    Emitter<CreateaccountState> emit,
  ) async {
    emit(state.copyWith(
        nameEditTextController: TextEditingController(),
        surnameEditTextController: TextEditingController(),
        surnameEditText2Controller: TextEditingController(),
        mailValueEditTextController: TextEditingController(),
        passwordEditTextController: TextEditingController(),
        confirmPasswordEditTextController: TextEditingController(),
        isShowPassword: true,
        isShowPassword1: true,
        acceptAllTermsAndConditions: false));
  }

  /// Calls [{{baseUrl}}/user/register] with the provided event and emits the state.
  ///
  /// The [CreateRegisterEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callPostRegister(
    CreateRegisterEvent event,
    Emitter<CreateaccountState> emit,
  ) async {
    var postPostRegisterReq = PostPostRegisterReq(
      firstname: state.nameEditTextController?.text ?? '',
      lastname: state.surnameEditTextController?.text ?? '',
      email: state.mailValueEditTextController?.text ?? '',
      password: state.passwordEditTextController?.text ?? '',
      role: Types.user,
    );
    await _repository.postRegister(
      headers: {},
      requestData: postPostRegisterReq.toJson(),
    ).then((value) async {
      postPostRegisterResp = value;
      _onPostRegisterSuccess(value, emit);
      event.onCreateRegisterEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onPostRegisterError();
      event.onCreateRegisterEventError?.call();
    });
  }

  void _onPostRegisterSuccess(
    PostPostRegisterResp resp,
    Emitter<CreateaccountState> emit,
  ) {}
  void _onPostRegisterError() {
    //implement error method body...
  }
}
