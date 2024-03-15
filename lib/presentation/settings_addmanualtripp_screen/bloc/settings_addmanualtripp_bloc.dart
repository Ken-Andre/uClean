import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ucleankim/presentation/settings_addmanualtripp_screen/models/settings_addmanualtripp_model.dart';
import 'package:ucleankim/data/models/createTrip/post_create_trip_resp.dart';
import 'package:ucleankim/data/models/createTrip/post_create_trip_req.dart';
import 'dart:async';
import 'package:ucleankim/data/repository/repository.dart';
import 'package:ucleankim/core/constants/created_by.dart';
import 'package:ucleankim/core/constants/trips.dart';
part 'settings_addmanualtripp_event.dart';
part 'settings_addmanualtripp_state.dart';

/// A bloc that manages the state of a SettingsAddmanualtripp according to the event that is dispatched to it.
class SettingsAddmanualtrippBloc
    extends Bloc<SettingsAddmanualtrippEvent, SettingsAddmanualtrippState> {
  SettingsAddmanualtrippBloc(SettingsAddmanualtrippState initialState)
      : super(initialState) {
    on<SettingsAddmanualtrippInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<CreateTripsMapsEvent>(_callCreateTrip);
  }

  final _repository = Repository();

  var postCreateTripResp = PostCreateTripResp();

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<SettingsAddmanualtrippState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
          id: 1,
          title: "title_personnal_car".tr,
          value: "car",
          isSelected: true),
      SelectionPopupModel(
          id: 2, title: "title_personnal_bike".tr, value: "bicycle"),
      SelectionPopupModel(id: 3, title: "title_bus".tr, value: "subway"),
      SelectionPopupModel(id: 4, title: "title_plane".tr, value: "subway"),
      SelectionPopupModel(id: 5, title: "title_common_car".tr, value: "subway"),
      SelectionPopupModel(
          id: 6, title: "title_common_bike".tr, value: "bicycle"),
    ];
  }

  _onInitialize(
    SettingsAddmanualtrippInitialEvent event,
    Emitter<SettingsAddmanualtrippState> emit,
  ) async {
    emit(state.copyWith(
        wedJanuary3Controller: TextEditingController(),
        oneThousandTwentyEightController: TextEditingController(),
        startLocationController: TextEditingController(),
        stopLocationController: TextEditingController()));
    emit(state.copyWith(
        settingsAddmanualtrippModelObj: state.settingsAddmanualtrippModelObj
            ?.copyWith(dropdownItemList: fillDropdownItemList())));
  }

  /// Calls [https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/trips_maps] with the provided event and emits the state.
  ///
  /// The [CreateTripsMapsEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callCreateTrip(
    CreateTripsMapsEvent event,
    Emitter<SettingsAddmanualtrippState> emit,
  ) async {
    var postCreateTripReq = PostCreateTripReq(
      distance: CreatedBy.initial,
      date: state.wedJanuary3Controller?.text ?? '',
      hour: state.oneThousandTwentyEightController?.text ?? '',
      meansoftransport:
          state.selectedDropDownValue?.value ?? Trips.meansoftransport3,
      pointa: state.startLocationController?.text ?? '',
      pointb: state.stopLocationController?.text ?? '',
      tripkind: Trips.defaulttripkind,
    );
    var cTripDetAuth = PrefUtils().getAuthToken();
    print('here is the cTripAuth $cTripDetAuth');
    await _repository.createTrip(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${cTripDetAuth}',
      },
      requestData: postCreateTripReq.toJson(),
    ).then((value) async {
      postCreateTripResp = value;
      _onCreateTripSuccess(value, emit);
      event.onCreateTripsMapsEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onCreateTripError();
      event.onCreateTripsMapsEventError?.call();
    });
  }

  void _onCreateTripSuccess(
    PostCreateTripResp resp,
    Emitter<SettingsAddmanualtrippState> emit,
  ) {}
  void _onCreateTripError() {
    //implement error method body...
  }
}
