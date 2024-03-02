import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/learn_container_screen/models/learn_container_model.dart';
part 'learn_container_event.dart';
part 'learn_container_state.dart';

/// A bloc that manages the state of a LearnContainer according to the event that is dispatched to it.
class LearnContainerBloc
    extends Bloc<LearnContainerEvent, LearnContainerState> {
  LearnContainerBloc(LearnContainerState initialState) : super(initialState) {
    on<LearnContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    LearnContainerInitialEvent event,
    Emitter<LearnContainerState> emit,
  ) async {}
}
