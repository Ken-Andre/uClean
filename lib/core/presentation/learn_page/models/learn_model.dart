// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'learnsection_item_model.dart';

/// This class defines the variables used in the [learn_page],
/// and is typically used to hold data that is passed between different parts of the application.
class LearnModel extends Equatable {
  LearnModel({this.learnsectionItemList = const []}) {}

  List<LearnsectionItemModel> learnsectionItemList;

  LearnModel copyWith({List<LearnsectionItemModel>? learnsectionItemList}) {
    return LearnModel(
      learnsectionItemList: learnsectionItemList ?? this.learnsectionItemList,
    );
  }

  @override
  List<Object?> get props => [learnsectionItemList];
}
