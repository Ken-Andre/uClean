import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/createaccounttwo_screen/models/createaccounttwo_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'createaccounttwo_event.dart';
part 'createaccounttwo_state.dart';

/// A bloc that manages the state of a Createaccounttwo according to the event that is dispatched to it.
class CreateaccounttwoBloc
    extends Bloc<CreateaccounttwoEvent, CreateaccounttwoState>
    with CodeAutoFill {
  CreateaccounttwoBloc(CreateaccounttwoState initialState)
      : super(initialState) {
    on<CreateaccounttwoInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<CreateaccounttwoState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  _onInitialize(
    CreateaccounttwoInitialEvent event,
    Emitter<CreateaccounttwoState> emit,
  ) async {
    emit(state.copyWith(
      otpController: TextEditingController(),
    ));
    listenForCode();
  }
}
