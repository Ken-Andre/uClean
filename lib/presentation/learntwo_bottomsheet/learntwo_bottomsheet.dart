import 'models/learntwo_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/learntwo_bloc.dart';

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
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 21.h,
        vertical: 26.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL12,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_vilogia_mobility".tr,
                style: CustomTextStyles.titleLargeSemiBold,
              ),
              SizedBox(height: 9.v),
              SizedBox(
                width: 350.h,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "lbl_vilogia_mobility".tr,
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "msg_vilogia_overview".tr,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: "msg_context".tr,
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "msg_objectives".tr,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: "msg_concrete_actions".tr,
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "msg_results_and_perspectives".tr,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: "msg_did_you_know".tr,
                        style: theme.textTheme.bodyMedium,
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
    );
  }
}
