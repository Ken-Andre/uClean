import '../learn_page/widgets/learnsection_item_widget.dart';
import 'bloc/learn_bloc.dart';
import 'models/learn_model.dart';
import 'models/learnsection_item_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';

// ignore_for_file: must_be_immutable
class LearnPage extends StatelessWidget {
  const LearnPage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<LearnBloc>(
      create: (context) => LearnBloc(LearnState(
        learnModelObj: LearnModel(),
      ))
        ..add(LearnInitialEvent()),
      child: LearnPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillPrimary,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 3.v),
            child: Column(
              children: [
                SizedBox(height: 53.v),
                Divider(),
                SizedBox(height: 7.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "lbl_articles".tr,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ),
                SizedBox(height: 6.v),
                Divider(),
                SizedBox(height: 13.v),
                _buildLearnSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLearnSection(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 25.h,
          right: 15.h,
        ),
        child: BlocSelector<LearnBloc, LearnState, LearnModel?>(
          selector: (state) => state.learnModelObj,
          builder: (context, learnModelObj) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  height: 6.v,
                );
              },
              itemCount: learnModelObj?.learnsectionItemList.length ?? 0,
              itemBuilder: (context, index) {
                LearnsectionItemModel model =
                    learnModelObj?.learnsectionItemList[index] ??
                        LearnsectionItemModel();
                return LearnsectionItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
