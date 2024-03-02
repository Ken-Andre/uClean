import '../models/linedelimiterreport_item_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';

// ignore: must_be_immutable
class LinedelimiterreportItemWidget extends StatelessWidget {
  LinedelimiterreportItemWidget(
    this.linedelimiterreportItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  LinedelimiterreportItemModel linedelimiterreportItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.maxFinite,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 16.v,
          ),
          decoration: AppDecoration.fillWhiteA.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgTripkindlogo,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.h),
                    child: Text(
                      "lbl_professionnal".tr,
                      style: CustomTextStyles.bodyMediumRobotoPrimaryContainer,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13.v),
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMeansoftransport,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12.h,
                      bottom: 2.v,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_from".tr,
                            style: CustomTextStyles.bodyLargeRobotoff606060,
                          ),
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            text: "lbl_eltham_station".tr,
                            style: CustomTextStyles.titleMediumRobotoff000000,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.v),
              Padding(
                padding: EdgeInsets.only(right: 65.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgMeansoftransportDeepOrange200,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12.h,
                        bottom: 2.v,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "lbl_to".tr,
                              style: CustomTextStyles.bodyLargeRobotoff606060,
                            ),
                            TextSpan(
                              text: " ",
                            ),
                            TextSpan(
                              text: "msg_melbourne_central".tr,
                              style: CustomTextStyles.titleMediumRobotoff000000,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "msg_12_15_pm_1_19".tr,
                    style: CustomTextStyles.titleMediumRoboto,
                  ),
                  Text(
                    "lbl_2km".tr,
                    style: CustomTextStyles.bodyLargeRobotoPrimaryContainer_1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
