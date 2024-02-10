import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/learnsection_item_model.dart';
import 'package:uclean/presentation/learn_page/models/learn_model.dart';
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
        learnModelObj: state.learnModelObj?.copyWith(
      learnsectionItemList: fillLearnsectionItemList(),
    )));
  }

  List<LearnsectionItemModel> fillLearnsectionItemList() {
    return [
      LearnsectionItemModel(
          skyImage: ImageConstant.imgAnArtisticAnd,
          skyText: "The beauty of the sky"),
      LearnsectionItemModel(
          skyImage: ImageConstant.imgThePhotoHighl,
          skyText: "Learn about CO2 footprint impact"),
      LearnsectionItemModel(
          skyImage: ImageConstant.imgThePhotoHighl113x353,
          skyText: "Understanding the Environmental Impact of Travel"),
      LearnsectionItemModel(
          skyImage: ImageConstant.imgThePhotoHighl1,
          skyText: "Reducing Your Carbon Footprint in Daily Travel")
    ];
  }
}
