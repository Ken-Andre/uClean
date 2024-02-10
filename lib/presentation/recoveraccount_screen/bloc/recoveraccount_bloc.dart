import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/recoveraccount_screen/models/recoveraccount_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'recoveraccount_event.dart';
part 'recoveraccount_state.dart';

/// A bloc that manages the state of a Recoveraccount according to the event that is dispatched to it.
class RecoveraccountBloc extends Bloc<RecoveraccountEvent, RecoveraccountState>
    with CodeAutoFill {
  RecoveraccountBloc(RecoveraccountState initialState) : super(initialState) {
    on<RecoveraccountInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<RecoveraccountState> emit,
  ) {
    emit(
        state.copyWith(otpController: TextEditingController(text: event.code)));
  }

  _onInitialize(
    RecoveraccountInitialEvent event,
    Emitter<RecoveraccountState> emit,
  ) async {
    emit(state.copyWith(otpController: TextEditingController()));
    listenForCode();
  }
}
