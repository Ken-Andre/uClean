import 'bloc/learntwo_bloc.dart';
import 'models/learntwo_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';

// ignore_for_file: must_be_immutable
class LearntwoBottomsheet extends StatelessWidget {
  const LearntwoBottomsheet({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<LearntwoBloc>(
      create: (context) => LearntwoBloc(LearntwoState(
        learntwoModelObj: LearntwoModel(),
      ))
        ..add(LearntwoInitialEvent()),
      child: LearntwoBottomsheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _buildTheBeautyOfTheSection(context),
    );
  }

  /// Section Widget
  Widget _buildTheBeautyOfTheSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Text(
              "msg_the_beauty_of_the".tr,
              style: CustomTextStyles.titleLargeBlack900Regular_1,
            ),
          ),
          SizedBox(height: 10.v),
          Container(
            width: 352.h,
            margin: EdgeInsets.only(left: 1.h),
            child: Text(
              "msg_in_our_journey_towards".tr,
              maxLines: 28,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall,
            ),
          ),
          SizedBox(height: 39.v),
        ],
      ),
    );
  }
}
