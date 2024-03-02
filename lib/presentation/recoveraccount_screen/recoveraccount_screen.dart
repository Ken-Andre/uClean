import 'package:ucleankim/widgets/custom_pin_code_text_field.dart';
import 'package:ucleankim/widgets/custom_elevated_button.dart';
import 'models/recoveraccount_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/recoveraccount_bloc.dart';

class RecoveraccountScreen extends StatelessWidget {
  const RecoveraccountScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<RecoveraccountBloc>(
        create: (context) => RecoveraccountBloc(
            RecoveraccountState(recoveraccountModelObj: RecoveraccountModel()))
          ..add(RecoveraccountInitialEvent()),
        child: RecoveraccountScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                height: SizeUtils.height,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 150.v),
                child: Stack(alignment: Alignment.bottomLeft, children: [
                  Opacity(
                      opacity: 0.6,
                      child: CustomImageView(
                          imagePath: ImageConstant.imgBlueGrandient3,
                          height: 271.v,
                          width: 97.h,
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(top: 31.v))),
                  Opacity(
                      opacity: 0.3,
                      child: CustomImageView(
                          imagePath: ImageConstant.imgYellowGrandient2,
                          height: 271.v,
                          width: 101.h,
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(bottom: 5.v))),
                  Opacity(
                      opacity: 0.6,
                      child: CustomImageView(
                          imagePath: ImageConstant.imgPinkGrandient2,
                          height: 271.v,
                          width: 136.h,
                          alignment: Alignment.topLeft)),
                  _buildFrameThirty(context),
                  CustomImageView(
                      imagePath: ImageConstant.imgGroupCyan800,
                      height: 186.adaptSize,
                      width: 186.adaptSize,
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 16.v))
                ]))));
  }

  /// Section Widget
  Widget _buildFrameThirty(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.only(left: 31.h, right: 31.h, bottom: 50.v),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text("lbl_recover_account".tr,
                  style: theme.textTheme.headlineSmall),
              SizedBox(height: 18.v),
              SizedBox(
                  width: 330.h,
                  child: Text("msg_write_the_code_that".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyLarge)),
              SizedBox(height: 28.v),
              Text("msg_dex_live_com".tr,
                  style: CustomTextStyles.titleMediumInter_1),
              SizedBox(height: 27.v),
              Padding(
                  padding: EdgeInsets.only(left: 59.h, right: 54.h),
                  child: BlocSelector<RecoveraccountBloc, RecoveraccountState,
                          TextEditingController?>(
                      selector: (state) => state.otpController,
                      builder: (context, otpController) {
                        return CustomPinCodeTextField(
                            context: context,
                            controller: otpController,
                            onChanged: (value) {
                              otpController?.text = value;
                            });
                      })),
              SizedBox(height: 29.v),
              CustomElevatedButton(
                  width: 185.h,
                  text: "lbl_continue".tr,
                  onPressed: () {
                    onTapContinue(context);
                  })
            ])));
  }

  /// Navigates to the recoveraccounttwoScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.recoveraccounttwoScreen,
    );
  }
}
