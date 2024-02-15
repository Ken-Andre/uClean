import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/core/utils/validation_functions.dart';
import 'package:uclean/widgets/custom_elevated_button.dart';
import 'package:uclean/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(LoginState(loginModelObj: LoginModel()))
          ..add(LoginInitialEvent()),
        child: LoginScreen());
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
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            height: 812.v,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(vertical: 110.v),
                            child:
                                Stack(alignment: Alignment.topLeft, children: [
                              Opacity(
                                  opacity: 0.3,
                                  child: CustomImageView(
                                      imagePath: ImageConstant
                                          .imgYellowGrandient271x118,
                                      height: 271.v,
                                      width: 118.h,
                                      alignment: Alignment.bottomLeft,
                                      margin: EdgeInsets.only(bottom: 5.v))),
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
                                                appTheme.deepOrange10090
                                              ]))))),
                              CustomImageView(
                                  imagePath: ImageConstant.imgLogoBlack900,
                                  height: 104.v,
                                  width: 259.h,
                                  alignment: Alignment.topRight,
                                  margin:
                                      EdgeInsets.only(top: 96.v, right: 54.h)),
                              _buildLoginForm(context),
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
                                                appTheme.cyan5090
                                              ])))))
                            ])))))));
  }

  /// Section Widget
  Widget _buildLoginForm(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.only(left: 28.h, right: 18.h, bottom: 162.v),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              BlocSelector<LoginBloc, LoginState, TextEditingController?>(
                  selector: (state) => state.emailController,
                  builder: (context, emailController) {
                    return CustomTextFormField(
                        controller: emailController,
                        hintText: "lbl_email".tr,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              (!isValidEmail(value, isRequired: true))) {
                            return "err_msg_please_enter_valid_email".tr;
                          }
                          return null;
                        },
                        contentPadding: EdgeInsets.all(10.h));
                  }),
              SizedBox(height: 12.v),
              BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                return CustomTextFormField(
                    controller: state.passwordController,
                    hintText: "lbl_password".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    suffix: InkWell(
                        onTap: () {
                          context.read<LoginBloc>().add(
                              ChangePasswordVisibilityEvent(
                                  value: !state.isShowPassword));
                        },
                        child: Container(
                            margin: EdgeInsets.fromLTRB(30.h, 13.v, 10.h, 13.v),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgEye,
                                height: 16.v,
                                width: 19.h))),
                    suffixConstraints: BoxConstraints(maxHeight: 44.v),
                    validator: (value) {
                      if (value == null ||
                          (!isValidPassword(value, isRequired: true))) {
                        return "err_msg_please_enter_valid_password".tr;
                      }
                      return null;
                    },
                    obscureText: state.isShowPassword);
              }),
              SizedBox(height: 12.v),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("lbl_no_account".tr, style: theme.textTheme.bodyLarge),
                GestureDetector(
                    onTap: () {
                      onTapTxtCreateOne(context);
                    },
                    child: Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: Text("lbl_create_one".tr,
                            style: CustomTextStyles.bodyLargeCyan800)))
              ]),
              SizedBox(height: 11.v),
              CustomElevatedButton(
                  width: 146.h,
                  text: "lbl_next".tr,
                  buttonStyle: CustomButtonStyles.fillCyanTL101,
                  onPressed: () {
                    onTapNext(context);
                  }),
              SizedBox(height: 14.v),
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {
                        onTapTxtForgotMyPassword(context);
                      },
                      child: Padding(
                          padding: EdgeInsets.only(right: 14.h),
                          child: Text("msg_forgot_my_password".tr,
                              style: CustomTextStyles.bodyLargeCyan800))))
            ])));
  }

  /// Navigates to the createaccountScreen when the action is triggered.
  onTapTxtCreateOne(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.createaccountScreen,
    );
  }

  /// Calls the {{baseUrl}}/user/login API and triggers a [CreateLoginEvent] event on the [LoginBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateLoginEvent] event on the [LoginBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  onTapNext(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
            CreateLoginEvent(
              onCreateLoginEventSuccess: () {
                _onPostUserLoginEventSuccess(context);
              },
              onCreateLoginEventError: () {
                _onPostUserLoginEventError(context);
              },
            ),
          );
    }
  }

  /// Navigates to the settingsContactusScreen when the action is triggered.
  void _onPostUserLoginEventSuccess(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsContactusScreen,
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  void _onPostUserLoginEventError(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeContainerScreen,
    );
  }

  /// Navigates to the recoveraccountScreen when the action is triggered.
  onTapTxtForgotMyPassword(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.recoveraccountScreen,
    );
  }
}
