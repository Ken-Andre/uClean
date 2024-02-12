import 'bloc/createaccountthree_bloc.dart';
import 'models/createaccountthree_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:uclean/core/app_export.dart';
import 'package:uclean/widgets/custom_elevated_button.dart';

class CreateaccountthreeScreen extends StatelessWidget {
  const CreateaccountthreeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<CreateaccountthreeBloc>(
      create: (context) => CreateaccountthreeBloc(CreateaccountthreeState(
        createaccountthreeModelObj: CreateaccountthreeModel(),
      ))
        ..add(CreateaccountthreeInitialEvent()),
      child: CreateaccountthreeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateaccountthreeBloc, CreateaccountthreeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: 430.h,
              child: Column(
                children: [
                  SizedBox(height: 110.v),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        height: 580.v,
                        width: 430.h,
                        margin: EdgeInsets.only(bottom: 202.v),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Opacity(
                                opacity: 0.8,
                                child: Container(
                                  width: 323.h,
                                  margin: EdgeInsets.only(top: 72.v),
                                  child: Text(
                                    "msg_enjoy_your_experience".tr,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles
                                        .bodyLargeInterOnErrorContainer,
                                  ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 0.6,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgBlueGrandient5,
                                height: 271.v,
                                width: 106.h,
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(top: 31.v),
                              ),
                            ),
                            Opacity(
                              opacity: 0.3,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgYellowGrandient7,
                                height: 271.v,
                                width: 101.h,
                                alignment: Alignment.bottomLeft,
                                margin: EdgeInsets.only(bottom: 58.v),
                              ),
                            ),
                            Opacity(
                              opacity: 0.6,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgPinkGrandient6,
                                height: 271.v,
                                width: 136.h,
                                alignment: Alignment.topLeft,
                              ),
                            ),
                            _buildWelcomeSection(context),
                            CustomElevatedButton(
                              width: 185.h,
                              text: "lbl_continue".tr,
                              margin: EdgeInsets.only(bottom: 173.v),
                              alignment: Alignment.bottomCenter,
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(top: 25.v),
                                child: Text(
                                  "msg_thanks_for_joining".tr,
                                  style: CustomTextStyles.titleLargeInter,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 107.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomElevatedButton(
                                      height: 40.v,
                                      text: "lbl_instagram".tr,
                                      leftIcon: Container(
                                        margin: EdgeInsets.only(right: 10.h),
                                        child: CustomImageView(
                                          imagePath: ImageConstant.imgInfo,
                                          height: 18.adaptSize,
                                          width: 18.adaptSize,
                                        ),
                                      ),
                                      buttonStyle: CustomButtonStyles.fillGray,
                                      buttonTextStyle: CustomTextStyles
                                          .bodyLargeDeeporange300,
                                    ),
                                    SizedBox(height: 13.v),
                                    CustomElevatedButton(
                                      height: 40.v,
                                      text: "lbl_linkedin".tr,
                                      leftIcon: Container(
                                        margin: EdgeInsets.only(right: 9.h),
                                        child: CustomImageView(
                                          imagePath: ImageConstant.imgLink,
                                          height: 17.adaptSize,
                                          width: 17.adaptSize,
                                        ),
                                      ),
                                      buttonStyle: CustomButtonStyles.fillGray,
                                      buttonTextStyle:
                                          CustomTextStyles.bodyLargeBlue300,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 116.v),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Opacity(
                                      opacity: 0.7,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.v),
                                        child: SizedBox(
                                          width: 105.h,
                                          child: Divider(
                                            color: appTheme.black900
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.7,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.h),
                                        child: Text(
                                          "lbl_follow_us_on".tr,
                                          style: CustomTextStyles
                                              .bodyLargeInterBlack900,
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.7,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.v),
                                        child: SizedBox(
                                          width: 114.h,
                                          child: Divider(
                                            color: appTheme.black900
                                                .withOpacity(0.6),
                                            indent: 9.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
      },
    );
  }

  /// Section Widget
  Widget _buildWelcomeSection(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: 39.h,
          top: 138.v,
          right: 46.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 105.h,
          vertical: 2.v,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: fs.Svg(
              ImageConstant.imgWelcome,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 152.v),
            Container(
              width: 124.h,
              margin: EdgeInsets.only(left: 9.h),
              child: Text(
                "msg_nice_to_meet_you".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleMediumSemiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
