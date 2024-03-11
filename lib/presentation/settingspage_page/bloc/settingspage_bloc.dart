import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/settingspage_page/models/settingspage_model.dart';
import 'package:ucleankim/data/models/logoutPost/post_logout_post_resp.dart';
import 'package:ucleankim/data/models/logoutPost/post_logout_post_req.dart';
import 'dart:async';
import 'package:ucleankim/data/repository/repository.dart';
part 'settingspage_event.dart';
part 'settingspage_state.dart';

/// A bloc that manages the state of a Settingspage according to the event that is dispatched to it.
class SettingspageBloc extends Bloc<SettingspageEvent, SettingspageState> {
  SettingspageBloc(SettingspageState initialState) : super(initialState) {
    on<SettingspageInitialEvent>(_onInitialize);
    on<CreateLogoutEvent>(_callLogoutPost);
  }

  final _repository = Repository();

  var postLogoutPostResp = PostLogoutPostResp();

  _onInitialize(
      SettingspageInitialEvent event,
      Emitter<SettingspageState> emit,
      ) async {}

  /// Calls [https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/logout] with the provided event and emits the state.
  ///
  /// The [CreateLogoutEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callLogoutPost(
      CreateLogoutEvent event,
      Emitter<SettingspageState> emit,
      ) async {
    var postLogoutPostReq = PostLogoutPostReq();
    var logToken = PrefUtils().getAuthToken();
    print('here is the logToken $logToken');
    await _repository.logoutPost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${logToken}',
      },
      requestData: postLogoutPostReq.toJson(),
    ).then((value) async {
      postLogoutPostResp = value;
      _onLogoutPostSuccess(value, emit);
      event.onCreateLogoutEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onLogoutPostError();
      event.onCreateLogoutEventError?.call();
    });
  }

  void _onLogoutPostSuccess(
      PostLogoutPostResp resp,
      Emitter<SettingspageState> emit,
      ) {}
  void _onLogoutPostError() {
    //implement error method body...
  }
}