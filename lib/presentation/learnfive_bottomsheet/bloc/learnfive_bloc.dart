import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/learnfive_bottomsheet/models/learnfive_model.dart';
part 'learnfive_event.dart';
part 'learnfive_state.dart';

/// A bloc that manages the state of a Learnfive according to the event that is dispatched to it.
class LearnfiveBloc extends Bloc<LearnfiveEvent, LearnfiveState> {
  LearnfiveBloc(LearnfiveState initialState) : super(initialState) {
    on<LearnfiveInitialEvent>(_onInitialize);
  }

  _onInitialize(
    LearnfiveInitialEvent event,
    Emitter<LearnfiveState> emit,
  ) async {}
}
