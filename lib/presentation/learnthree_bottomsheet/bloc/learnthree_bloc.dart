import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/learnthree_bottomsheet/models/learnthree_model.dart';
part 'learnthree_event.dart';
part 'learnthree_state.dart';

/// A bloc that manages the state of a Learnthree according to the event that is dispatched to it.
class LearnthreeBloc extends Bloc<LearnthreeEvent, LearnthreeState> {
  LearnthreeBloc(LearnthreeState initialState) : super(initialState) {
    on<LearnthreeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    LearnthreeInitialEvent event,
    Emitter<LearnthreeState> emit,
  ) async {}
}
