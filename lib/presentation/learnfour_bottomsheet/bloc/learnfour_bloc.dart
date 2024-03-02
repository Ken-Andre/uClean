import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/learnfour_bottomsheet/models/learnfour_model.dart';
part 'learnfour_event.dart';
part 'learnfour_state.dart';

/// A bloc that manages the state of a Learnfour according to the event that is dispatched to it.
class LearnfourBloc extends Bloc<LearnfourEvent, LearnfourState> {
  LearnfourBloc(LearnfourState initialState) : super(initialState) {
    on<LearnfourInitialEvent>(_onInitialize);
  }

  _onInitialize(
    LearnfourInitialEvent event,
    Emitter<LearnfourState> emit,
  ) async {}
}
