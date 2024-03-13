import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/profile_screen/models/profile_model.dart';
import 'package:ucleankim/data/models/getAuthMe/get_get_auth_me_resp.dart';
import 'dart:async';
import 'package:ucleankim/data/repository/repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
part 'profile_event.dart';
part 'profile_state.dart';

/// A bloc that manages the state of a Profile according to the event that is dispatched to it.
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(ProfileState initialState) : super(initialState) {
    on<ProfileInitialEvent>(_onInitialize);
    on<FetchMeEvent>(_callGetAuthMe);
  }

  final _repository = Repository();

  var getGetAuthMeResp = GetGetAuthMeResp();

  /// Calls the https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/me API and triggers a [FetchMeEvent] event on the [ProfileBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  _onInitialize(
      ProfileInitialEvent event,
      Emitter<ProfileState> emit,
      ) async {
      print('We are on _onInitialize');
    add(
      FetchMeEvent(
        onFetchMeEventError: () {
          _onGetAuthMeEventError();
        },
      ),
    );
  }

  /// Calls [https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/me] with the provided event and emits the state.
  ///
  /// The [FetchMeEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callGetAuthMe(
      FetchMeEvent event,
      Emitter<ProfileState> emit,
      ) async {
    var cTripAuth = PrefUtils().getAuthToken();
    print('here is the cTripAuth $cTripAuth');
    await _repository.getAuthMe(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${cTripAuth}',
      },
    ).then((value) async {
      getGetAuthMeResp = value;
      print('Here the getTrips value: \n ${getGetAuthMeResp.toString()}');
      _onGetAuthMeSuccess(value, emit);
      print('We got the values');
    }).onError((error, stackTrace) {
      //implement error call
            print('API call failed: $error');
      _onGetAuthMeError();
      event.onFetchMeEventError?.call();
    });
  }

  void _onGetAuthMeSuccess(
      GetGetAuthMeResp resp,
      Emitter<ProfileState> emit,
      ) {
      print('Yes, the response was not empty');
       print('Here in the emiting function getGetAuthMe value: \n $resp');
       print('${resp.createdAt} and ${resp.name} and ${resp.email}');
    emit(
      state.copyWith(
        profileModelObj: state.profileModelObj?.copyWith(
          sixHundredFortyMillionSevenHun: (resp.createdAt ?? 0).toString(), // Assuming createdAt is a number
          isabelleKarol: resp.name ?? '',
          email: resp.email ?? '',
        ),
      ),
    );
  }

  void _onGetAuthMeError() {
    //implement error method body...
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onGetAuthMeEventError() {
    Fluttertoast.showToast(
      msg: "API Call failed.",
    );
  }
}
