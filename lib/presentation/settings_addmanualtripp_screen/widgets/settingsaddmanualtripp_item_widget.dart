import '../models/settingsaddmanualtripp_item_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';

// ignore: must_be_immutable
class SettingsaddmanualtrippItemWidget extends StatelessWidget {
  SettingsaddmanualtrippItemWidget(
    this.settingsaddmanualtrippItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SettingsaddmanualtrippItemModel settingsaddmanualtrippItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 38.h,
        vertical: 5.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 58.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgContrastWhiteA70001,
                  height: 19.adaptSize,
                  width: 19.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 5.v),
                ),
                Container(
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  decoration: AppDecoration.outlineBlack.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCarBlack900,
                    height: 30.adaptSize,
                    width: 30.adaptSize,
                    radius: BorderRadius.circular(
                      3.h,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgContrastWhiteA70001,
            height: 19.adaptSize,
            width: 19.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 5.v),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgSubwayButton,
            height: 30.adaptSize,
            width: 30.adaptSize,
            radius: BorderRadius.circular(
              3.h,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgContrastWhiteA70001,
            height: 19.adaptSize,
            width: 19.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 5.v),
          ),
          Container(
            height: 30.adaptSize,
            width: 30.adaptSize,
            decoration: AppDecoration.outlineBlack.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgMotorcycle,
              height: 30.adaptSize,
              width: 30.adaptSize,
              radius: BorderRadius.circular(
                3.h,
              ),
              alignment: Alignment.center,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgContrastWhiteA70001,
            height: 19.adaptSize,
            width: 19.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 5.v),
          ),
          Container(
            height: 30.v,
            width: 28.h,
            decoration: AppDecoration.outlineBlack.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgWalk,
              height: 30.v,
              width: 28.h,
              radius: BorderRadius.circular(
                3.h,
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
