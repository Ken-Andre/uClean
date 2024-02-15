import 'bloc/recoveraccounttwo_bloc.dart';
import 'models/recoveraccounttwo_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/core/utils/validation_functions.dart';
import 'package:uclean/widgets/custom_elevated_button.dart';
import 'package:uclean/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class RecoveraccounttwoScreen extends StatelessWidget {
  RecoveraccounttwoScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    var arg =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return BlocProvider<RecoveraccounttwoBloc>(
        create: (context) => RecoveraccounttwoBloc(RecoveraccounttwoState(
            recoveraccounttwoModelObj: RecoveraccounttwoModel(),
            email: arg[NavigationArgs.email]))
          ..add(RecoveraccounttwoInitialEvent()),
        child: RecoveraccounttwoScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: 430.h,
                    child: Column(children: [
                      SizedBox(height: 110.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                                  height: 542.v,
                                  width: 430.h,
                                  margin: EdgeInsets.only(bottom: 240.v),
                                  child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Opacity(
                                            opacity: 0.6,
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgBlueGrandient271x106,
                                                height: 271.v,
                                                width: 106.h,
                                                alignment: Alignment.topRight,
                                                margin: EdgeInsets.only(
                                                    top: 31.v))),
                                        Opacity(
                                            opacity: 0.3,
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgYellowGrandient2,
                                                height: 271.v,
                                                width: 101.h,
                                                alignment: Alignment.bottomLeft,
                                                margin: EdgeInsets.only(
                                                    bottom: 20.v))),
                                        Opacity(
                                            opacity: 0.6,
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgPinkGrandient2,
                                                height: 271.v,
                                                width: 136.h,
                                                alignment: Alignment.topLeft)),
                                        _buildPasswordRecovery(context),
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgGroupCyan800,
                                            height: 186.adaptSize,
                                            width: 186.adaptSize,
                                            alignment: Alignment.topCenter,
                                            margin: EdgeInsets.only(top: 16.v))
                                      ]))))
                    ])))));
  }

  /// Section Widget
  Widget _buildPasswordRecovery(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.only(left: 49.h, right: 35.h),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text("lbl_change_password".tr,
                  style: theme.textTheme.headlineSmall),
              SizedBox(height: 16.v),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      width: 305.h,
                      margin: EdgeInsets.only(left: 5.h, right: 34.h),
                      child: Text("msg_change_your_password".tr,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyLarge))),
              SizedBox(height: 26.v),
              BlocBuilder<RecoveraccounttwoBloc, RecoveraccounttwoState>(
                  builder: (context, state) {
                return CustomTextFormField(
                    controller: state.passwordController,
                    hintText: "lbl_new_password".tr,
                    textInputType: TextInputType.visiblePassword,
                    suffix: InkWell(
                        onTap: () {
                          context.read<RecoveraccounttwoBloc>().add(
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
              SizedBox(height: 15.v),
              BlocBuilder<RecoveraccounttwoBloc, RecoveraccounttwoState>(
                  builder: (context, state) {
                return CustomTextFormField(
                    controller: state.confirmpasswordController,
                    hintText: "msg_confirm_password".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    suffix: InkWell(
                        onTap: () {
                          context.read<RecoveraccounttwoBloc>().add(
                              ChangePasswordVisibilityEvent1(
                                  value: !state.isShowPassword1));
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
                    obscureText: state.isShowPassword1);
              }),
              SizedBox(height: 29.v),
              CustomElevatedButton(
                  width: 185.h,
                  text: "lbl_continue".tr,
                  onPressed: () {
                    validatepasswordchangepassandgotoLogin(context);
                  })
            ])));
  }

  /// Calls the {{baseUrl}}/user/password API and triggers a [UpdatePasswordEvent] event on the [RecoveraccounttwoBloc] bloc.
  ///
  /// Validates the form and triggers a [UpdatePasswordEvent] event on the [RecoveraccounttwoBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  validatepasswordchangepassandgotoLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<RecoveraccounttwoBloc>().add(
        UpdatePasswordEvent(
          onUpdatePasswordEventSuccess: () {
            _onPutPasswordEventSuccess(context);
          },
        ),
      );
    }
  }

  /// Navigates to the loginScreen when the action is triggered.
  void _onPutPasswordEventSuccess(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
