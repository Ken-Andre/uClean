import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/createaccount_screen/models/createaccount_model.dart';
part 'createaccount_event.dart';
part 'createaccount_state.dart';

/// A bloc that manages the state of a Createaccount according to the event that is dispatched to it.
class CreateaccountBloc extends Bloc<CreateaccountEvent, CreateaccountState> {
  CreateaccountBloc(CreateaccountState initialState) : super(initialState) {
    on<CreateaccountInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<CreateaccountState> emit,
  ) {
    emit(state.copyWith(
      isShowPassword: event.value,
    ));
  }

  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<CreateaccountState> emit,
  ) {
    emit(state.copyWith(
      isShowPassword1: event.value,
    ));
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
    ));
  }
}
