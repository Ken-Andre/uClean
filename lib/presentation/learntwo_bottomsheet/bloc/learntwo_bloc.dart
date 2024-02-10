import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/learntwo_bottomsheet/models/learntwo_model.dart';
part 'learntwo_event.dart';
part 'learntwo_state.dart';

/// A bloc that manages the state of a Learntwo according to the event that is dispatched to it.
class LearntwoBloc extends Bloc<LearntwoEvent, LearntwoState> {
  LearntwoBloc(LearntwoState initialState) : super(initialState) {
    on<LearntwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    LearntwoInitialEvent event,
    Emitter<LearntwoState> emit,
  ) async {}
}
