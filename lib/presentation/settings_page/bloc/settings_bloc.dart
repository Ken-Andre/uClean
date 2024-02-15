import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:uclean/presentation/settings_page/models/settings_model.dart';
import 'package:uclean/data/models/listUser/post_list_user_resp.dart';
import 'package:uclean/data/models/listUser/post_list_user_req.dart';
import 'dart:async';
import 'package:uclean/data/repository/repository.dart';
part 'settings_event.dart';
part 'settings_state.dart';

/// A bloc that manages the state of a Settings according to the event that is dispatched to it.
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(SettingsState initialState) : super(initialState) {
    on<SettingsInitialEvent>(_onInitialize);
    on<CreateListEvent>(_callListUser);
  }

  final _repository = Repository();

  var postListUserResp = PostListUserResp();

  _onInitialize(
    SettingsInitialEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(
        checkConfigurationController: TextEditingController(),
        reportingPeriodsController: TextEditingController()));
  }

  /// Calls [https://nodedemo.dhiwise.co/device/api/v1/user/list] with the provided event and emits the state.
  ///
  /// The [CreateListEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callListUser(
    CreateListEvent event,
    Emitter<SettingsState> emit,
  ) async {
    var postListUserReq = PostListUserReq();
    await _repository.listUser(
      headers: {},
      requestData: postListUserReq.toJson(),
    ).then((value) async {
      postListUserResp = value;
      _onListUserSuccess(value, emit);
      event.onCreateListEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onListUserError();
    });
  }

  void _onListUserSuccess(
    PostListUserResp resp,
    Emitter<SettingsState> emit,
  ) {}
  void _onListUserError() {
    //implement error method body...
  }
}
