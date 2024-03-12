import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/report_item_model.dart';
import 'package:ucleankim/presentation/report_page/models/report_model.dart';
import 'package:ucleankim/data/models/getTripsFromX8kiLetlTwmt/get_get_trips_from_x8ki_letl_twmt_resp.dart';
import 'dart:async';
import 'package:ucleankim/data/repository/repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
part 'report_event.dart';
part 'report_state.dart';

/// A bloc that manages the state of a Report according to the event that is dispatched to it.
class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc(ReportState initialState) : super(initialState) {
    on<ReportInitialEvent>(_onInitialize);
    on<FetchTripsEvent>(_callGetTripsFromX8kiLetlTwmt);
  }

  final _repository = Repository();

  var getGetTripsFromX8kiLetlTwmtResp = <GetGetTripsFromX8kiLetlTwmtResp>[];

  /// Calls the https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/trips API and triggers a [FetchTripsEvent] event on the [ReportBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  _onInitialize(
      ReportInitialEvent event,
      Emitter<ReportState> emit,
      ) async {
    emit(state.copyWith(
        reportModelObj: state.reportModelObj
            ?.copyWith(reportItemList: fillReportItemList())));
    add(
      FetchTripsEvent(
        onFetchTripsEventSuccess: () {
          _onGetTripsFromX8kiLetlTwmtEventSuccess();
        },
        onFetchTripsEventError: () {
          _onGetTripsFromX8kiLetlTwmtEventError();
        },
      ),
    );
  }

  List<ReportItemModel> fillReportItemList() {
    return [
      ReportItemModel(
          tripKind: "Professionnal",
          fromElthamStation: ImageConstant.imgMeansoftransport,
          image: ImageConstant.imgMeansoftransportDeepOrange200,
          time: "12:15 PM - 1:19 PM",
          distance: "2K"),
      ReportItemModel(
          tripKind: "Personnal",
          fromElthamStation: ImageConstant.imgMeansoftransport1,
          image: ImageConstant.imgMeansoftransport2,
          time: "12:15 PM - 1:19 PM",
          distance: "9K"),
      ReportItemModel(
          tripKind: "Professionnal",
          fromElthamStation: ImageConstant.imgMeansoftransport,
          image: ImageConstant.imgMeansoftransportDeepOrange200,
          time: "12:15 PM - 1:19 PM",
          distance: "3K"),
      ReportItemModel(
          tripKind: "Professionnal",
          fromElthamStation: ImageConstant.imgMeansoftransport,
          image: ImageConstant.imgMeansoftransportDeepOrange200,
          time: "12:15 PM - 1:19 PM",
          distance: "1.2K"),
      ReportItemModel(
          tripKind: "Professionnal",
          fromElthamStation: ImageConstant.imgMeansoftransport,
          image: ImageConstant.imgMeansoftransportDeepOrange200,
          time: "12:15 PM - 1:19 PM",
          distance: "3.6K")
    ];
  }

  /// Calls [https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/trips] with the provided event and emits the state.
  ///
  /// The [FetchTripsEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callGetTripsFromX8kiLetlTwmt(
      FetchTripsEvent event,
      Emitter<ReportState> emit,
      ) async {
    await _repository.getTripsFromX8kiLetlTwmt(
      headers: {
        'Content-type': 'application/json',
      },
    ).then((value) async {
      getGetTripsFromX8kiLetlTwmtResp = value;
      print('Here the getTrips value: \n ${getGetTripsFromX8kiLetlTwmtResp}');
      _onGetTripsFromX8kiLetlTwmtSuccess(value, emit);
      print('We got the values');
      event.onFetchTripsEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onGetTripsFromX8kiLetlTwmtError();
      event.onFetchTripsEventError?.call();
    });
  }

  ///Handling route based on bottom click actions
  String getAccurateTransImg(String? transportkind) {
    switch (transportkind) {
      case 'car':
        return ImageConstant.imgMeansoftransport1;
      case 'subway':
        return ImageConstant.imgSubwayButton;
    // case BottomBarEnum.Television:
    //   return "/";
      case 'bicycle':
        return ImageConstant.imgMotorcycle;
      case 'walk':
        return ImageConstant.imgWalk;
      default:
        return ImageConstant.imgMeansoftransport1;
    }
  }
  // void _onGetTripsFromX8kiLetlTwmtSuccess(
  //     List<GetGetTripsFromX8kiLetlTwmtResp> resp,
  //     Emitter<ReportState> emit,
  //     ) {
  //   var reportItemModelList = <ReportItemModel>[];
  //   if (resp.isNotEmpty) {
  //     print('Yes the response was not empty');
  //     print('${resp.length} trips to map');
  //     for (var element in resp) {
  //       print('${reportItemModelList.length} element in the list');
  //       var reportItemModel = ReportItemModel();
  //       var meansoftransElement = element.meansoftransport;
  //       print(meansoftransElement);
  //       reportItemModel.distance = (element.distance ?? 0) as String?;
  //       reportItemModel.time = element.date ?? '';
  //       reportItemModel.tripKind = element.tripkind ?? 'N/A';
  //       // reportItemModel.fromElthamStation =
  //       //     getAccurateTransImg(meansoftransElement) ?? ImageConstant.imgMeansoftransport1;
  //       // reportItemModel.image = getAccurateTransImg(meansoftransElement) ?? ImageConstant.imgMeansoftransport;
  //       reportItemModelList.add(reportItemModel);
  //       print('${reportItemModelList.length} element in the list');
  //       print('Element ${element.id} added in the List');
  //     }
  //     print('reportItemModelList filled from bloc');
  //   }
  //   emit(
  //     state.copyWith(
  //       reportModelObj: state.reportModelObj?.copyWith(
  //         reportItemList: reportItemModelList,
  //       ),
  //     ),
  //   );
  // }
  void _onGetTripsFromX8kiLetlTwmtSuccess(
      List<GetGetTripsFromX8kiLetlTwmtResp> resp,
      Emitter<ReportState> emit,
      ) {
    var reportItemModelList = <ReportItemModel>[];
    if (resp.isNotEmpty) {
      print('Yes, the response was not empty');
      for (var element in resp) {
        var reportItemModel = ReportItemModel();
        var meansoftransElement = element.meansoftransport;

        reportItemModel.distance = (element.distance?.toStringAsFixed(2) ?? 0).toString();
        reportItemModel.time = element.date ?? '';
        reportItemModel.tripKind = element.tripkind ?? 'N/A';
        reportItemModel.pointa = element.pointa ?? 'Ethanol Station';
        reportItemModel.pointb = element.pointb ?? 'New Jersey';
        // Check for null or unexpected values in meansoftransElement
        if (meansoftransElement != null) {
          reportItemModel.fromElthamStation = getAccurateTransImg(meansoftransElement);
          reportItemModel.image = getAccurateTransImg(meansoftransElement);
        } else {
          // Handle null or unexpected values gracefully
          reportItemModel.fromElthamStation = ImageConstant.imgMeansoftransport;
          reportItemModel.image = ImageConstant.imgMeansoftransportDeepOrange200;
        }

        reportItemModelList.add(reportItemModel);
        print('Element ${element.id} added to the list');
      }

      print('reportItemModelList filled from bloc');
    }

    print('${reportItemModelList.length} elements in the list');

    emit(
      state.copyWith(
        reportModelObj: state.reportModelObj?.copyWith(
          reportItemList: reportItemModelList,
        ),
      ),
    );
  }


  void _onGetTripsFromX8kiLetlTwmtError() {
    //implement error method body...
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onGetTripsFromX8kiLetlTwmtEventSuccess() {
    Fluttertoast.showToast(
      msg: "Successful fetched!",
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onGetTripsFromX8kiLetlTwmtEventError() {
    Fluttertoast.showToast(
      msg: "Fetch Failed",
    );
  }
}
