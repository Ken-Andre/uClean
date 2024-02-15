import 'bloc/report_bloc.dart';
import 'models/report_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ReportPage extends StatelessWidget {
  const ReportPage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ReportBloc>(
      create: (context) => ReportBloc(ReportState(
        reportModelObj: ReportModel(),
      ))
        ..add(ReportInitialEvent()),
      child: ReportPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: double.maxFinite,
              decoration: AppDecoration.fillPrimary,
              child: Column(
                children: [
                  SizedBox(height: 47.v),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Divider(),
                          SizedBox(height: 6.v),
                          _buildAllTripsRow(context),
                          _buildNewgroup(context),
                          SizedBox(height: 8.v),
                          _buildUntripTwoStack(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAllTripsRow(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.fillPrimary,
      child: Row(
        children: [
          Text(
            "lbl_all_trips".tr,
            style: theme.textTheme.bodySmall,
          ),
          Padding(
            padding: EdgeInsets.only(left: 26.h),
            child: Text(
              "lbl_january_2024".tr,
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNewgroup(BuildContext context) {
    return SizedBox(
      height: 162.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 15.v,
              width: double.maxFinite,
              margin: EdgeInsets.only(bottom: 147.v),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 6.v,
                          bottom: 7.v,
                        ),
                        child: SizedBox(
                          width: 143.h,
                          child: Divider(),
                        ),
                      ),
                      Text(
                        "lbl_tuesday_16".tr,
                        style: CustomTextStyles.bodySmallInter_1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 6.v,
                          bottom: 7.v,
                        ),
                        child: SizedBox(
                          width: 143.h,
                          child: Divider(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 138.v,
              width: 353.h,
              margin: EdgeInsets.only(
                left: 20.h,
                top: 24.v,
                right: 20.h,
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 138.v,
                      width: 353.h,
                      decoration: BoxDecoration(
                        color: appTheme.gray50,
                        borderRadius: BorderRadius.circular(
                          3.h,
                        ),
                        border: Border.all(
                          color: appTheme.black900.withOpacity(0.25),
                          width: 1.h,
                          strokeAlign: strokeAlignCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: appTheme.black900.withOpacity(0.25),
                            spreadRadius: 2.h,
                            blurRadius: 2.h,
                            offset: Offset(
                              0,
                              3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTopContainerUnTrip(
                            context,
                            dynamicText1: "lbl_0_9".tr,
                            dynamicText2: "lbl_km2".tr,
                            dynamicText3: "lbl_ucac_icam".tr,
                          ),
                          SizedBox(height: 16.v),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 7.v),
                                child: Column(
                                  children: [
                                    Text(
                                      "lbl_12_41".tr,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    SizedBox(height: 15.v),
                                    Text(
                                      "lbl_13_17".tr,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgFlashlight,
                                height: 46.v,
                                width: 12.h,
                                margin: EdgeInsets.only(
                                  left: 6.h,
                                  top: 2.v,
                                  bottom: 9.v,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "msg_douala_cameroon".tr,
                                      style: theme.textTheme.labelMedium,
                                    ),
                                    Text(
                                      "msg_xq9r_xr1_parking".tr,
                                      style: CustomTextStyles.bodySmallInter,
                                    ),
                                    SizedBox(height: 7.v),
                                    Text(
                                      "msg_douala_cameroon".tr,
                                      style: theme.textTheme.labelMedium,
                                    ),
                                    Text(
                                      "msg_3_972_9_798_palace".tr,
                                      style: CustomTextStyles.bodySmallInter,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 21.v),
                          CustomImageView(
                            imagePath: ImageConstant.imgFrame5669,
                            height: 12.v,
                            width: 333.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUntripTwoStack(BuildContext context) {
    return SizedBox(
      height: 138.v,
      width: 353.h,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopContainerUnTrip(
                context,
                dynamicText1: "lbl_0_9".tr,
                dynamicText2: "lbl_km2".tr,
                dynamicText3: "lbl_ucac_icam".tr,
              ),
              SizedBox(height: 21.v),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 6.v),
                    child: Column(
                      children: [
                        Text(
                          "lbl_12_41".tr,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall,
                        ),
                        SizedBox(height: 20.v),
                        Text(
                          "lbl_13_17".tr,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgFlashlight,
                    height: 46.v,
                    width: 12.h,
                    margin: EdgeInsets.only(
                      left: 5.h,
                      bottom: 6.v,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "msg_douala_cameroon".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                        SizedBox(height: 5.v),
                        Text(
                          "msg_xq9r_xr1_parking".tr,
                          style: CustomTextStyles.bodySmallInter,
                        ),
                        SizedBox(height: 14.v),
                        Text(
                          "msg_douala_cameroon".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                        SizedBox(height: 5.v),
                        Text(
                          "msg_3_972_9_798_palace".tr,
                          style: CustomTextStyles.bodySmallInter,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.v),
              CustomImageView(
                imagePath: ImageConstant.imgFrame5669,
                height: 12.v,
                width: 333.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildTopContainerUnTrip(
    BuildContext context, {
    required String dynamicText1,
    required String dynamicText2,
    required String dynamicText3,
  }) {
    return Row(
      children: [
        Text(
          dynamicText1,
          style: theme.textTheme.labelLarge!.copyWith(
            color: appTheme.black900,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 14.h,
            top: 3.v,
            bottom: 3.v,
          ),
          child: Text(
            dynamicText2,
            style: CustomTextStyles.bodySmall8.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        Spacer(
          flex: 49,
        ),
        CustomImageView(
          imagePath: ImageConstant.imgBag,
          height: 18.v,
          width: 15.h,
        ),
        Spacer(
          flex: 50,
        ),
        Text(
          dynamicText3,
          style: theme.textTheme.bodySmall!.copyWith(
            color: appTheme.black900,
          ),
        ),
      ],
    );
  }
}
