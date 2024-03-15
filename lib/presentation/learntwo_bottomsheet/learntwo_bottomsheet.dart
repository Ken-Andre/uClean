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
                "msg_the_beauty_of_the".tr,
                style: CustomTextStyles.titleLargeSemiBold,
              ),
              SizedBox(height: 9.v),
              SizedBox(
                width: 350.h,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "msg_in_our_journey_towards2".tr,
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "lbl_walkin".tr,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: "msg_g_a_step_closer".tr,
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "lbl_cyclin".tr,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: "msg_g_pedal_through".tr,
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "msg_public_transport".tr,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
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
