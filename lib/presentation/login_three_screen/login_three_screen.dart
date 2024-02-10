import 'bloc/login_three_bloc.dart';
import 'models/login_three_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/core/utils/validation_functions.dart';
import 'package:uclean/widgets/custom_elevated_button.dart';
import 'package:uclean/widgets/custom_text_form_field.dart';

class LoginThreeScreen extends StatelessWidget {
  LoginThreeScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginThreeBloc>(
      create: (context) => LoginThreeBloc(LoginThreeState(
        loginThreeModelObj: LoginThreeModel(),
      ))
        ..add(LoginThreeInitialEvent()),
      child: LoginThreeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                height: 812.v,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 110.v),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgLogoBlack900,
                      height: 104.v,
                      width: 259.h,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(
                        top: 96.v,
                        right: 54.h,
                      ),
                    ),
                    _buildLoginFrameNine(context),
                    Opacity(
                      opacity: 0.3,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgYellowGrandient3,
                        height: 271.v,
                        width: 118.h,
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(bottom: 5.v),
                      ),
                    ),
                    Opacity(
                      opacity: 0.6,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 271.adaptSize,
                          width: 271.adaptSize,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.5, 0.5),
                              end: Alignment(0.5, 1),
                              colors: [
                                appTheme.deepOrange20090,
                                appTheme.deepOrange10090,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.6,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 271.adaptSize,
                          width: 271.adaptSize,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.5, 0.5),
                              end: Alignment(0.5, 1),
                              colors: [
                                appTheme.tealA40090,
                                appTheme.cyan5090,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginFrameNine(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 28.h,
          top: 199.v,
          right: 18.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<LoginThreeBloc, LoginThreeState>(
              builder: (context, state) {
                return CustomTextFormField(
                  controller: state.passwordController,
                  hintText: "lbl_password".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  suffix: InkWell(
                    onTap: () {
                      context.read<LoginThreeBloc>().add(
                          ChangePasswordVisibilityEvent(
                              value: !state.isShowPassword));
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(30.h, 13.v, 10.h, 13.v),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgEye,
                        height: 16.v,
                        width: 19.h,
                      ),
                    ),
                  ),
                  suffixConstraints: BoxConstraints(
                    maxHeight: 44.v,
                  ),
                  validator: (value) {
                    if (value == null ||
                        (!isValidPassword(value, isRequired: true))) {
                      return "err_msg_please_enter_valid_password".tr;
                    }
                    return null;
                  },
                  obscureText: state.isShowPassword,
                );
              },
            ),
            SizedBox(height: 14.v),
            Text(
              "msg_forgot_my_password".tr,
              style: CustomTextStyles.bodyLargeCyan800,
            ),
            SizedBox(height: 9.v),
            CustomElevatedButton(
              width: 153.h,
              text: "lbl_login".tr,
              buttonStyle: CustomButtonStyles.fillCyanTL101,
            ),
          ],
        ),
      ),
    );
  }
}
