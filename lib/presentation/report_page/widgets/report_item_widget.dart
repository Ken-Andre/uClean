import '../models/report_item_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';

// ignore: must_be_immutable
class ReportItemWidget extends StatelessWidget {
  ReportItemWidget(
      this.reportItemModelObj, {
        Key? key,
      }) : super(
    key: key,
  );

  ReportItemModel reportItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
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
                  reportItemModelObj.tripKind!,
                  style: CustomTextStyles.bodyLargeRobotoPrimaryContainer_1,
                ),
              ),
            ],
          ),
          SizedBox(height: 13.v),
          Row(
            children: [
              CustomImageView(
                imagePath: reportItemModelObj?.fromElthamStation,
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
                        style: theme.textTheme.bodyLarge,
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
                  imagePath: reportItemModelObj?.image,
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
                          style: theme.textTheme.bodyLarge,
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
                reportItemModelObj.time!,
                style: CustomTextStyles.titleMediumRoboto,
              ),
              Text(
                reportItemModelObj.distance!,
                style: CustomTextStyles.bodyLargeRobotoPrimaryContainer_1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
