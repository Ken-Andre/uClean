import 'package:ucleankim/widgets/custom_text_form_field.dart';
import 'package:ucleankim/core/utils/validation_functions.dart';
import 'package:ucleankim/widgets/custom_elevated_button.dart';
import 'models/recoveraccounttwo_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/recoveraccounttwo_bloc.dart';

// ignore_for_file: must_be_immutable
class RecoveraccounttwoScreen extends StatelessWidget {
  RecoveraccounttwoScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<RecoveraccounttwoBloc>(
        create: (context) => RecoveraccounttwoBloc(RecoveraccounttwoState(
            recoveraccounttwoModelObj: RecoveraccounttwoModel()))
          ..add(RecoveraccounttwoInitialEvent()),
        child: RecoveraccounttwoScreen());
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
                            height: SizeUtils.height,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(vertical: 150.v),
                            child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Opacity(
                                      opacity: 0.6,
                                      child: CustomImageView(
                                          imagePath:
                                              ImageConstant.imgBlueGrandient2,
                                          height: 271.v,
                                          width: 97.h,
                                          alignment: Alignment.topRight,
                                          margin: EdgeInsets.only(top: 31.v))),
                                  Opacity(
                                      opacity: 0.3,
                                      child: CustomImageView(
                                          imagePath: ImageConstant
                                              .imgYellowGrandient271x64,
                                          height: 271.v,
                                          width: 64.h,
                                          alignment: Alignment.bottomLeft,
                                          margin:
                                              EdgeInsets.only(bottom: 30.v))),
                                  Opacity(
                                      opacity: 0.6,
                                      child: CustomImageView(
                                          imagePath: ImageConstant
                                              .imgPinkGrandient271x99,
                                          height: 271.v,
                                          width: 99.h,
                                          alignment: Alignment.topLeft)),
                                  _buildFrameThirty(context),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgGroupCyan800,
                                      height: 186.adaptSize,
                                      width: 186.adaptSize,
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.only(top: 16.v))
                                ])))))));
  }

  /// Section Widget
  Widget _buildFrameThirty(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.only(left: 30.h, right: 16.h, bottom: 10.v),
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
                    onTapContinue(context);
                  })
            ])));
  }

  /// Navigates to the splashScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.splashScreen,
    );
  }
}
