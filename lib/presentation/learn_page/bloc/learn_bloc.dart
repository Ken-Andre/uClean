import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/learncontainer_item_model.dart';
import 'package:ucleankim/presentation/learn_page/models/learn_model.dart';
part 'learn_event.dart';
part 'learn_state.dart';

/// A bloc that manages the state of a Learn according to the event that is dispatched to it.
class LearnBloc extends Bloc<LearnEvent, LearnState> {
  LearnBloc(LearnState initialState) : super(initialState) {
    on<LearnInitialEvent>(_onInitialize);
  }

  _onInitialize(
    LearnInitialEvent event,
    Emitter<LearnState> emit,
  ) async {
    emit(state.copyWith(
        learnModelObj: state.learnModelObj
            ?.copyWith(learncontainerItemList: fillLearncontainerItemList())));
  }

  List<LearncontainerItemModel> fillLearncontainerItemList() {
    return [
      LearncontainerItemModel(
          image: ImageConstant.imgAnArtisticAnd,
          theBeautyOfThe: "msg_Vilogia".tr),
      LearncontainerItemModel(
          image: ImageConstant.imgThePhotoHighl,
          theBeautyOfThe: "msg_Emissions_de_CO2".tr),
      LearncontainerItemModel(
          image: ImageConstant.imgThePhotoHighl113x353,
          theBeautyOfThe: "msg_Emissions_de_CO2_hors_UTCATF".tr),
      LearncontainerItemModel(
          image: ImageConstant.imgThePhotoHighl1,
          theBeautyOfThe: "msg_le_schema_du_directeur".tr)
    ];
  }
}
