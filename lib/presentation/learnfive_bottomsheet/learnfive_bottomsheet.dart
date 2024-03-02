import 'models/learnfive_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/learnfive_bloc.dart';

// ignore_for_file: must_be_immutable
class LearnfiveBottomsheet extends StatelessWidget {
  const LearnfiveBottomsheet({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<LearnfiveBloc>(
      create: (context) => LearnfiveBloc(LearnfiveState(
        learnfiveModelObj: LearnfiveModel(),
      ))
        ..add(LearnfiveInitialEvent()),
      child: LearnfiveBottomsheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          _buildReducingYourCarbon(
            context,
            reducingYourCarbon: "msg_reducing_your_carbon2".tr,
            description: "msg_welcome_to_the_understanding".tr,
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 26.v,
              ),
              decoration: AppDecoration.fillPrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL12,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 331.h,
                    margin: EdgeInsets.only(
                      left: 1.h,
                      right: 20.h,
                    ),
                    child: Text(
                      "msg_reducing_your_carbon2".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLargeSemiBold,
                    ),
                  ),
                  SizedBox(height: 16.v),
                  Container(
                    width: 352.h,
                    margin: EdgeInsets.only(left: 1.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "msg_welcome_to_the_understanding2".tr,
                            style: theme.textTheme.bodyMedium,
                          ),
                          TextSpan(
                            text: "msg_the_journey_begins".tr,
                            style: CustomTextStyles.titleSmallff000000,
                          ),
                          TextSpan(
                            text: "msg_embark_on_a_journey".tr,
                            style: theme.textTheme.bodyMedium,
                          ),
                          TextSpan(
                            text: "msg_unveiling_the_footprint_every".tr,
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
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildReducingYourCarbon(
    BuildContext context, {
    required String reducingYourCarbon,
    required String description,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 26.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 331.h,
            margin: EdgeInsets.only(
              left: 1.h,
              right: 20.h,
            ),
            child: Text(
              reducingYourCarbon,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.titleLargeSemiBold.copyWith(
                color: appTheme.black900,
              ),
            ),
          ),
          SizedBox(height: 16.v),
          Container(
            width: 352.h,
            margin: EdgeInsets.only(left: 1.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "msg_welcome_to_the_understanding2".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: "msg_the_journey_begins".tr,
                    style: CustomTextStyles.titleSmallff000000,
                  ),
                  TextSpan(
                    text: "msg_embark_on_a_journey".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: "msg_unveiling_the_footprint_every".tr,
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
