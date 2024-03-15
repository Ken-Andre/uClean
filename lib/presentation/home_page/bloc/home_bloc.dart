import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/home_page/models/home_model.dart';
import 'package:ucleankim/data/models/getAuthMe/get_get_auth_me_resp.dart';
import 'dart:async';
import 'package:ucleankim/data/repository/repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
    on<FetchMeEvent>(_callGetAuthMe);
    on<UpdateHomeModelEvent>(_updateHomeModel);
  }

  final _repository = Repository();

  var getGetAuthMeResp = GetGetAuthMeResp();

  /// Calls the https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/me API and triggers a [FetchMeEvent] event on the [HomeBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
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
    Emitter<HomeState> emit,
  ) async {
    var getAuthT = PrefUtils().getAuthToken();
    print('here is the getAuthT $getAuthT');
    await _repository.getAuthMe(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${getAuthT}',
      },
    ).then((value) async {
      getGetAuthMeResp = value;
      _onGetAuthMeSuccess(value, emit);
    }).onError((error, stackTrace) {
      //implement error call
      _onGetAuthMeError();
      event.onFetchMeEventError?.call();
    });
  }

  void _onGetAuthMeSuccess(
    GetGetAuthMeResp resp,
    Emitter<HomeState> emit,
  ) {
    String? welcomeWord = resp.name;
    emit(
      state.copyWith(
        homeModelObj: state.homeModelObj?.copyWith(
          welcomeIsabelle: 'Welcome ' + welcomeWord! ?? 'Welcome',
          gamingPoints: (resp.id ?? 0).toString(),
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
      msg: "Data not Fetched.",
    );
  }

  Future<void> _updateHomeModel(
      UpdateHomeModelEvent event, Emitter<HomeState> emit) async {
    final updatedState = state.copyWith(homeModelObj: event.updatedHomeModel);
    emit(updatedState);
  }
}
