// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'learncontainer_item_model.dart';

/// This class defines the variables used in the [learn_page],
/// and is typically used to hold data that is passed between different parts of the application.
class LearnModel extends Equatable {
  LearnModel({this.learncontainerItemList = const []}) {}

  List<LearncontainerItemModel> learncontainerItemList;

  LearnModel copyWith({List<LearncontainerItemModel>? learncontainerItemList}) {
    return LearnModel(
      learncontainerItemList:
          learncontainerItemList ?? this.learncontainerItemList,
    );
  }

  @override
  List<Object?> get props => [learncontainerItemList];
}
