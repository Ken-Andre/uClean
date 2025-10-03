import 'package:flutter/cupertino.dart';

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
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: appTheme.whiteA70001,
        borderRadius: BorderRadius.circular(12.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Trip Kind Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.v),
            decoration: BoxDecoration(
              color: appTheme.lightGreen200,
              borderRadius: BorderRadius.circular(16.h),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgTripkindlogo,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                ),
                SizedBox(width: 8.h),
                Text(
                  reportItemModelObj.tripKind!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.v),
          // From Location
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(6.h),
                decoration: BoxDecoration(
                  color: appTheme.gray10001,
                  borderRadius: BorderRadius.circular(8.h),
                ),
                child: CustomImageView(
                  imagePath: reportItemModelObj.fromElthamStation,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                ),
              ),
              SizedBox(width: 12.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "lbl_from".tr,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontFamily: 'Inter',
                        color: appTheme.black900.withValues(alpha: 0.6),
                      ),
                    ),
                    SizedBox(height: 2.v),
                    Text(
                      reportItemModelObj.pointa ?? "lbl_eltham_station".tr,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.v),
          // To Location
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(6.h),
                decoration: BoxDecoration(
                  color: appTheme.gray10001,
                  borderRadius: BorderRadius.circular(8.h),
                ),
                child: CustomImageView(
                  imagePath: reportItemModelObj.image,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                ),
              ),
              SizedBox(width: 12.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "lbl_to".tr,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontFamily: 'Inter',
                        color: appTheme.black900.withValues(alpha: 0.6),
                      ),
                    ),
                    SizedBox(height: 2.v),
                    Text(
                      reportItemModelObj.pointb ?? "msg_melbourne_central".tr,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.v),
          Divider(color: appTheme.black900.withValues(alpha: 0.1)),
          SizedBox(height: 12.v),
          // Time and Distance
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.access_time,
                      size: 16,
                      color: appTheme.black900.withValues(alpha: 0.6)),
                  SizedBox(width: 8.h),
                  Text(
                    reportItemModelObj.time!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                '${reportItemModelObj.distance!}m',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: appTheme.cyan800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
