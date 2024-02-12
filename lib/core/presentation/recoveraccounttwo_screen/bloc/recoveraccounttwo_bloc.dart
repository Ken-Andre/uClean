import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/recoveraccounttwo_screen/models/recoveraccounttwo_model.dart';
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
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<RecoveraccounttwoState> emit,
  ) {
    emit(state.copyWith(
      isShowPassword: event.value,
    ));
  }

  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<RecoveraccounttwoState> emit,
  ) {
    emit(state.copyWith(
      isShowPassword1: event.value,
    ));
  }

  _onInitialize(
    RecoveraccounttwoInitialEvent event,
    Emitter<RecoveraccounttwoState> emit,
  ) async {
    emit(state.copyWith(
      passwordController: TextEditingController(),
      confirmpasswordController: TextEditingController(),
      isShowPassword: true,
      isShowPassword1: true,
    ));
  }
}
