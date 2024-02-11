import '../report_page/widgets/titleunclasslist_item_widget.dart';
import 'bloc/report_bloc.dart';
import 'models/report_model.dart';
import 'models/titleunclasslist_item_model.dart';
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
                  child: SizedBox(
                    height: 836.v,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildTitleUnclassRow(context),
                              SizedBox(height: 3.v),
                              _buildUntripOneColumn(context),
                              SizedBox(height: 9.v),
                              _buildUntripTwoColumn(context),
                              SizedBox(height: 11.v),
                              _buildTitleUnclassList(context),
                              SizedBox(height: 8.v),
                              _buildUntripLastColumn(context),
                            ],
                          ),
                        ),
                        _buildTopNavAppColumn(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTitleUnclassRow(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 1.v,
              bottom: 12.v,
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
              top: 1.v,
              bottom: 12.v,
            ),
            child: SizedBox(
              width: 143.h,
              child: Divider(),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUntripOneColumn(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19.h),
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      decoration: AppDecoration.outlineBlack9004.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 3.v),
          Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: _buildTopContainerUnTripRow(
              context,
              dynamicText: "lbl_0_9".tr,
              dynamicText1: "lbl_km2".tr,
              dynamicImage: ImageConstant.imgBag,
              personnal: "lbl_ucac_icam".tr,
            ),
          ),
          SizedBox(height: 19.v),
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
                imagePath: ImageConstant.imgThumbsUpBlack900,
                height: 45.v,
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
          SizedBox(height: 12.v),
          Container(
            height: 25.v,
            width: 334.h,
            margin: EdgeInsets.only(left: 3.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 24.v,
                    width: 29.h,
                    margin: EdgeInsets.only(left: 21.h),
                    decoration: BoxDecoration(
                      color: appTheme.gray100,
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
                CustomImageView(
                  imagePath: ImageConstant.imgBottomContainer,
                  height: 25.v,
                  width: 334.h,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUntripTwoColumn(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19.h),
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      decoration: AppDecoration.outlineBlack9004.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: _buildTopContainerUnTripRow(
              context,
              dynamicText: "lbl_7_9".tr,
              dynamicText1: "lbl_km2".tr,
              dynamicImage: ImageConstant.imgHomeBlack900,
              personnal: "lbl_personnal".tr,
            ),
          ),
          SizedBox(height: 20.v),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 7.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "lbl_16_12".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                    SizedBox(height: 15.v),
                    Text(
                      "lbl_18_15".tr,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgThumbsUpBlack900,
                height: 45.v,
                width: 12.h,
                margin: EdgeInsets.only(
                  left: 5.h,
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
                      "msg_entree_lycee_ndogpassi".tr,
                      style: CustomTextStyles.bodySmallInter,
                    ),
                    SizedBox(height: 7.v),
                    Text(
                      "msg_douala_cameroon".tr,
                      style: theme.textTheme.labelMedium,
                    ),
                    Text(
                      "msg_entree_lycee_ndogpassi".tr,
                      style: CustomTextStyles.bodySmallInter,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.v),
          Container(
            height: 25.v,
            width: 334.h,
            margin: EdgeInsets.only(left: 3.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 24.v,
                    width: 29.h,
                    margin: EdgeInsets.only(left: 21.h),
                    decoration: BoxDecoration(
                      color: appTheme.gray100,
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
                CustomImageView(
                  imagePath: ImageConstant.imgBottomContainer,
                  height: 25.v,
                  width: 334.h,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTitleUnclassList(BuildContext context) {
    return BlocSelector<ReportBloc, ReportState, ReportModel?>(
      selector: (state) => state.reportModelObj,
      builder: (context, reportModelObj) {
        return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 8.v,
            );
          },
          itemCount: reportModelObj?.titleunclasslistItemList.length ?? 0,
          itemBuilder: (context, index) {
            TitleunclasslistItemModel model =
                reportModelObj?.titleunclasslistItemList[index] ??
                    TitleunclasslistItemModel();
            return TitleunclasslistItemWidget(
              model,
            );
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildUntripLastColumn(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19.h),
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      decoration: AppDecoration.outlineBlack9004.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 3.v),
          Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: _buildTopContainerUnTripRow(
              context,
              dynamicText: "lbl_0_9".tr,
              dynamicText1: "lbl_km2".tr,
              dynamicImage: ImageConstant.imgBag,
              personnal: "lbl_ucac_icam".tr,
            ),
          ),
          SizedBox(height: 19.v),
          SizedBox(
            height: 54.v,
            width: 190.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 6.v),
                    child: Text(
                      "lbl_13_17".tr,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 54.v,
                    width: 189.h,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.v),
                            child: Text(
                              "msg_xq9r_xr1_parking".tr,
                              style: CustomTextStyles.bodySmallInter,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 48.h),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "msg_douala_cameroon".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                                SizedBox(height: 5.v),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "msg_3_972_9_798_palace".tr,
                                    style: CustomTextStyles.bodySmallInter,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgLockBlack90045x12,
                          height: 45.v,
                          width: 12.h,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(
                            left: 31.h,
                            top: 2.v,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lbl_12_41".tr,
                                style: theme.textTheme.bodySmall,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 23.h,
                                  bottom: 7.v,
                                ),
                                child: Text(
                                  "msg_douala_cameroon".tr,
                                  style: theme.textTheme.labelMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.v),
          Container(
            height: 25.v,
            width: 334.h,
            margin: EdgeInsets.only(left: 3.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 24.v,
                    width: 29.h,
                    margin: EdgeInsets.only(left: 21.h),
                    decoration: BoxDecoration(
                      color: appTheme.gray100,
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
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgLinkedin,
                        height: 12.v,
                        width: 9.h,
                        margin: EdgeInsets.only(
                          top: 7.v,
                          bottom: 5.v,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 11.h),
                        child: SizedBox(
                          height: 25.v,
                          child: VerticalDivider(
                            width: 1.h,
                            thickness: 1.v,
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgCar,
                        height: 12.v,
                        width: 16.h,
                        margin: EdgeInsets.only(
                          left: 5.h,
                          top: 7.v,
                          bottom: 5.v,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7.h),
                        child: SizedBox(
                          height: 25.v,
                          child: VerticalDivider(
                            width: 1.h,
                            thickness: 1.v,
                          ),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 25.v,
                        child: VerticalDivider(
                          width: 1.h,
                          thickness: 1.v,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgThumbsUp,
                        height: 12.v,
                        width: 11.h,
                        margin: EdgeInsets.only(
                          left: 7.h,
                          top: 7.v,
                          bottom: 5.v,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTopNavAppColumn(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(),
          SizedBox(height: 6.v),
          Container(
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
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildTopContainerUnTripRow(
    BuildContext context, {
    required String dynamicText,
    required String dynamicText1,
    required String dynamicImage,
    required String personnal,
  }) {
    return Row(
      children: [
        Text(
          dynamicText,
          style: CustomTextStyles.labelLargePoppins.copyWith(
            color: appTheme.black900,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 15.h,
            top: 2.v,
            bottom: 3.v,
          ),
          child: Text(
            dynamicText1,
            style: CustomTextStyles.bodySmall8.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        Spacer(
          flex: 54,
        ),
        CustomImageView(
          imagePath: dynamicImage,
          height: 17.v,
          width: 15.h,
        ),
        Spacer(
          flex: 45,
        ),
        Text(
          personnal,
          style: theme.textTheme.bodySmall!.copyWith(
            color: appTheme.black900,
          ),
        ),
      ],
    );
  }
}
