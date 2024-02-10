import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/notifspanel_screen/models/notifspanel_model.dart';
part 'notifspanel_event.dart';
part 'notifspanel_state.dart';

/// A bloc that manages the state of a Notifspanel according to the event that is dispatched to it.
class NotifspanelBloc extends Bloc<NotifspanelEvent, NotifspanelState> {
  NotifspanelBloc(NotifspanelState initialState) : super(initialState) {
    on<NotifspanelInitialEvent>(_onInitialize);
  }

  _onInitialize(
    NotifspanelInitialEvent event,
    Emitter<NotifspanelState> emit,
  ) async {}
}
