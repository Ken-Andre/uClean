import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/createaccountthree_screen/models/createaccountthree_model.dart';
part 'createaccountthree_event.dart';
part 'createaccountthree_state.dart';

/// A bloc that manages the state of a Createaccountthree according to the event that is dispatched to it.
class CreateaccountthreeBloc
    extends Bloc<CreateaccountthreeEvent, CreateaccountthreeState> {
  CreateaccountthreeBloc(CreateaccountthreeState initialState)
      : super(initialState) {
    on<CreateaccountthreeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CreateaccountthreeInitialEvent event,
    Emitter<CreateaccountthreeState> emit,
  ) async {}
}
