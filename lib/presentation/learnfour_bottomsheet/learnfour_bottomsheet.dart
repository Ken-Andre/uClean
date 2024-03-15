import 'models/learnfour_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/learnfour_bloc.dart';

// ignore_for_file: must_be_immutable
class LearnfourBottomsheet extends StatelessWidget {
  const LearnfourBottomsheet({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<LearnfourBloc>(
      create: (context) => LearnfourBloc(LearnfourState(
        learnfourModelObj: LearnfourModel(),
      ))
        ..add(LearnfourInitialEvent()),
      child: LearnfourBottomsheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 26.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL12,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 350.h,
              child: Text(
                "msg_understanding_the2".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleLargeSemiBold,
              ),
            ),
            SizedBox(height: 11.v),
            SizedBox(
              width: 352.h,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "lbl_introduction".tr,
                      style: CustomTextStyles.titleSmallff000000,
                    ),
                    TextSpan(
                      text: "msg_welcome_to_a_journey".tr,
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: "msg_the_footprint_of".tr,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: "msg_start_by_understanding".tr,
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: "msg_the_pedal_power".tr,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: "msg_explore_the_world".tr,
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: "msg_the_shared_journey".tr,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: "msg_discover_the_collective".tr,
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: "msg_the_power_of_carpooling".tr,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 8.v),
          ],
        ),
      ),
    );
  }
}
