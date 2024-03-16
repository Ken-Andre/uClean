import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/presentation/settings_addmanualtrippresvers_screen/models/settings_addmanualtrippresvers_model.dart';
import 'package:ucleankim/data/models/createTrip/post_create_trip_req.dart';
import 'package:ucleankim/data/models/createTrip/post_create_trip_resp.dart';
import '/core/app_export.dart';
import '../models/settingsaddmanualtrippresvers_item_model.dart';
import 'package:ucleankim/data/repository/repository.dart';
import 'package:ucleankim/core/constants/trips.dart';

part 'settings_addmanualtrippresvers_event.dart';
part 'settings_addmanualtrippresvers_state.dart';

/// A bloc that manages the state of a SettingsAddmanualtrippresvers according to the event that is dispatched to it.
class SettingsAddmanualtrippresversBloc extends Bloc<
    SettingsAddmanualtrippresversEvent, SettingsAddmanualtrippresversState> {
  SettingsAddmanualtrippresversBloc(
      SettingsAddmanualtrippresversState initialState)
      : super(initialState) {
    on<SettingsAddmanualtrippresversInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<CreateTripsEvent>(_callCreateTrip);
  }

  List<SettingsaddmanualtrippresversItemModel>
      fillSettingsaddmanualtrippresversItemList() {
    return List.generate(
        1, (index) => SettingsaddmanualtrippresversItemModel());
  }

  final _repository = Repository();

  var postCreateTripResp = PostCreateTripResp();

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<SettingsAddmanualtrippresversState> emit,
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
          id: 2, title: "title_personnal_bike".tr, value: "bike"),
      SelectionPopupModel(id: 3, title: "title_bus".tr, value: "bus"),
      SelectionPopupModel(id: 4, title: "title_plane".tr, value: "plane"),
      SelectionPopupModel(id: 5, title: "title_common_car".tr, value: "taxi"),
      SelectionPopupModel(
          id: 6, title: "title_common_bike".tr, value: "taxi_bike"),
      SelectionPopupModel(id: 7, title: "title_walk".tr, value: "walk"),
    ];
  }

  _onInitialize(
    SettingsAddmanualtrippresversInitialEvent event,
    Emitter<SettingsAddmanualtrippresversState> emit,
  ) async {
    emit(state.copyWith(
        wedJanuary31Controller: TextEditingController(),
        oneThousandTwentyEightController: TextEditingController(),
        kmController: TextEditingController()));
    emit(state.copyWith(
        settingsAddmanualtrippresversModelObj:
            state.settingsAddmanualtrippresversModelObj?.copyWith(
                // settingsaddmanualtrippresversItemList: fillSettingsaddmanualtrippresversItemList(),
                dropdownItemList: fillDropdownItemList())));
  }

  /// Calls [https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/trips] with the provided event and emits the state.
  ///
  /// The [CreateTripsEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callCreateTrip(
    CreateTripsEvent event,
    Emitter<SettingsAddmanualtrippresversState> emit,
  ) async {
    var postCreateTripReq = PostCreateTripReq(
      distance: int.tryParse(state.kmController?.text ?? ''),
      date: state.wedJanuary31Controller?.text ?? '',
      meansoftransport:
          state.selectedDropDownValue?.value ?? Trips.meansoftransport1,
      tripkind: Trips.defaulttripkind,
      hour: state.oneThousandTwentyEightController?.text ?? '',
    );
    var cTripAuth = PrefUtils().getAuthToken();
    print('here is the cTripAuth $cTripAuth');
    await _repository.createTrip(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${cTripAuth}',
      },
      requestData: postCreateTripReq.toJson(),
    ).then((value) async {
      postCreateTripResp = value;
      _onCreateTripSuccess(value, emit);
      event.onCreateTripsEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onCreateTripError(error, emit);
      event.onCreateTripsEventError?.call();
    });
  }

  void _onCreateTripSuccess(
    PostCreateTripResp resp,
    Emitter<SettingsAddmanualtrippresversState> emit,
  ) {}
  void _onCreateTripError(
    Object? error,
    Emitter<SettingsAddmanualtrippresversState> emit,
  ) {
    print(error);
    //implement error method body...
  }
}
