import 'package:ucleankim/presentation/learnfive_bottomsheet/learnfive_bottomsheet.dart';
import 'package:ucleankim/presentation/learnfour_bottomsheet/learnfour_bottomsheet.dart';
import 'package:ucleankim/presentation/learnthree_bottomsheet/learnthree_bottomsheet.dart';

import 'widgets/learncontainer_item_widget.dart';
import 'models/learncontainer_item_model.dart';
import 'models/learn_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/learn_bloc.dart';
import 'package:ucleankim/presentation/learntwo_bottomsheet/learntwo_bottomsheet.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<LearnBloc>(
        create: (context) => LearnBloc(LearnState(learnModelObj: LearnModel()))
          ..add(LearnInitialEvent()),
        child: LearnPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA,
                child: Column(children: [
                  SizedBox(height: 65.v),
                  _buildTopNavApp(context),
                  SizedBox(height: 14.v),
                  _buildLearnContainer(context)
                ]))));
  }

  /// Section Widget
  Widget _buildTopNavApp(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        decoration: AppDecoration.outlineWhiteA,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 6.v),
          Text("lbl_articles".tr, style: theme.textTheme.titleLarge)
        ]));
  }

  /// Section Widget
  Widget _buildLearnContainer(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: BlocSelector<LearnBloc, LearnState, LearnModel?>(
            selector: (state) => state.learnModelObj,
            builder: (context, learnModelObj) {
              return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 6.v);
                  },
                  itemCount: learnModelObj?.learncontainerItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    LearncontainerItemModel model =
                        learnModelObj?.learncontainerItemList[index] ??
                            LearncontainerItemModel();
                    return LearncontainerItemWidget(model,
                        onTapTheBeautyOfThe: () {
                      onTapTheBeautyOfThe(context, index);
                    });
                  });
            }));
  }

  /// Displays a bottom sheet widget using the [showModalBottomSheet] method
  /// of the [Scaffold] class with [isScrollControlled] set to true.
  ///
  /// The bottom sheet is built using the [LearntwoBottomsheet]
  /// class and the [builder] method of the bottom sheet is passed the
  /// [BuildContext] object.
  onTapTheBeautyOfThe(BuildContext context, int index) {
    switch (index) {
      case 0:
        return showModalBottomSheet(
            context: context,
            builder: (_) => LearntwoBottomsheet.builder(context),
            isScrollControlled: true);
      case 1:
        return showModalBottomSheet(
            context: context,
            builder: (_) => LearnthreeBottomsheet.builder(context),
            isScrollControlled: true);
      case 2:
        return showModalBottomSheet(
            context: context,
            builder: (_) => LearnfourBottomsheet.builder(context),
            isScrollControlled: true);
      case 3:
        return showModalBottomSheet(
            context: context,
            builder: (_) => LearnfiveBottomsheet.builder(context),
            isScrollControlled: true);
      default:
        return showModalBottomSheet(
            context: context,
            builder: (_) => LearntwoBottomsheet.builder(context),
            isScrollControlled: true);
    }

    //showModalBottomSheet(
    //    context: context,
    //    builder: (_) => LearntwoBottomsheet.builder(context),
    //    isScrollControlled: true);
  }
}
