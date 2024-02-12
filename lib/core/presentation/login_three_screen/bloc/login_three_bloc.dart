import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/login_three_screen/models/login_three_model.dart';
part 'login_three_event.dart';
part 'login_three_state.dart';

/// A bloc that manages the state of a LoginThree according to the event that is dispatched to it.
class LoginThreeBloc extends Bloc<LoginThreeEvent, LoginThreeState> {
  LoginThreeBloc(LoginThreeState initialState) : super(initialState) {
    on<LoginThreeInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<LoginThreeState> emit,
  ) {
    emit(state.copyWith(
      isShowPassword: event.value,
    ));
  }

  _onInitialize(
    LoginThreeInitialEvent event,
    Emitter<LoginThreeState> emit,
  ) async {
    emit(state.copyWith(
      passwordController: TextEditingController(),
      isShowPassword: true,
    ));
  }
}
