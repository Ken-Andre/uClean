import 'models/learnthree_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/learnthree_bloc.dart';

// ignore_for_file: must_be_immutable
class LearnthreeBottomsheet extends StatelessWidget {
  const LearnthreeBottomsheet({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<LearnthreeBloc>(
      create: (context) => LearnthreeBloc(LearnthreeState(
        learnthreeModelObj: LearnthreeModel(),
      ))
        ..add(LearnthreeInitialEvent()),
      child: LearnthreeBottomsheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 21.h,
        vertical: 26.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "msg_learn_about_co22".tr,
            style: CustomTextStyles.titleLargeSemiBold,
          ),
          SizedBox(height: 9.v),
          Container(
            width: 344.h,
            margin: EdgeInsets.only(right: 6.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "msg_welcome_to_the_learn2".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: "msg_why_is_it_important".tr,
                    style: CustomTextStyles.titleSmallff000000,
                  ),
                  TextSpan(
                    text: "msg_every_action_we".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: "msg_how_does_it_work_our".tr,
                    style: CustomTextStyles.titleSmallff000000,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 9.v),
        ],
      ),
    );
  }
}
