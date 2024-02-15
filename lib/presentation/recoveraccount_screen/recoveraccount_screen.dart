import 'bloc/recoveraccount_bloc.dart';
import 'models/recoveraccount_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/widgets/custom_elevated_button.dart';
import 'package:uclean/widgets/custom_pin_code_text_field.dart';

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
            body: SizedBox(
                width: 430.h,
                child: Column(children: [
                  SizedBox(height: 110.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              height: 522.v,
                              width: 430.h,
                              margin: EdgeInsets.only(bottom: 260.v),
                              child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    Opacity(
                                        opacity: 0.6,
                                        child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgBlueGrandient2,
                                            height: 271.v,
                                            width: 106.h,
                                            alignment: Alignment.topRight,
                                            margin:
                                                EdgeInsets.only(top: 31.v))),
                                    Opacity(
                                        opacity: 0.3,
                                        child: CustomImageView(
                                            imagePath: ImageConstant
                                                .imgYellowGrandient3,
                                            height: 271.v,
                                            width: 101.h,
                                            alignment: Alignment.bottomLeft)),
                                    Opacity(
                                        opacity: 0.6,
                                        child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgPinkGrandient3,
                                            height: 271.v,
                                            width: 136.h,
                                            alignment: Alignment.topLeft)),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 49.h,
                                                right: 49.h,
                                                bottom: 20.v),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text("lbl_recover_account".tr,
                                                      style: theme.textTheme
                                                          .headlineSmall),
                                                  SizedBox(height: 18.v),
                                                  SizedBox(
                                                      width: 330.h,
                                                      child: Text(
                                                          "msg_write_the_code_that"
                                                              .tr,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: theme.textTheme
                                                              .bodyLarge)),
                                                  SizedBox(height: 28.v),
                                                  Text(""),
                                                  SizedBox(height: 27.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 59.h,
                                                          right: 54.h),
                                                      child: BlocSelector<
                                                              RecoveraccountBloc,
                                                              RecoveraccountState,
                                                              TextEditingController?>(
                                                          selector: (state) =>
                                                              state
                                                                  .otpController,
                                                          builder: (context,
                                                              otpController) {
                                                            return CustomPinCodeTextField(
                                                                context:
                                                                    context,
                                                                controller:
                                                                    otpController,
                                                                onChanged:
                                                                    (value) {
                                                                  otpController
                                                                          ?.text =
                                                                      value;
                                                                });
                                                          })),
                                                  SizedBox(height: 29.v),
                                                  CustomElevatedButton(
                                                      width: 185.h,
                                                      text: "lbl_continue".tr,
                                                      onPressed: () {
                                                        recoverAccounttoken(
                                                            context);
                                                      })
                                                ]))),
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgGroupCyan800,
                                        height: 186.adaptSize,
                                        width: 186.adaptSize,
                                        alignment: Alignment.topCenter,
                                        margin: EdgeInsets.only(bottom: 1.v))
                                  ]))))
                ]))));
  }

  /// Calls the {{baseUrl}}/user/reset-password/{token} API and triggers a [UpdateTokenEvent] event on the [RecoveraccountBloc] bloc.
  ///
  /// The [BuildContext] parameter represents current [BuildContext]
  recoverAccounttoken(BuildContext context) {
    context.read<RecoveraccountBloc>().add(
      UpdateTokenEvent(
        onUpdateTokenEventSuccess: () {
          _onPutResetPasswordTokenEventSuccess(context);
        },
      ),
    );
  }

  /// Navigates to the recoveraccounttwoScreen when the action is triggered.
  void _onPutResetPasswordTokenEventSuccess(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.recoveraccounttwoScreen, arguments: {
      NavigationArgs.email:
          context.read<RecoveraccountBloc>().putPutResetPasswordTokenResp.email
    });
  }
}
