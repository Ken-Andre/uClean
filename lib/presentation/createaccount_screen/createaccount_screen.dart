import 'bloc/createaccount_bloc.dart';
import 'models/createaccount_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/core/utils/validation_functions.dart';
import 'package:uclean/widgets/custom_elevated_button.dart';
import 'package:uclean/widgets/custom_text_form_field.dart';

class CreateaccountScreen extends StatelessWidget {
  CreateaccountScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<CreateaccountBloc>(
      create: (context) => CreateaccountBloc(CreateaccountState(
        createaccountModelObj: CreateaccountModel(),
      ))
        ..add(CreateaccountInitialEvent()),
      child: CreateaccountScreen(),
    );
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
            child: Column(
              children: [
                SizedBox(height: 110.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      height: 543.v,
                      width: 430.h,
                      margin: EdgeInsets.only(bottom: 239.v),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Opacity(
                            opacity: 0.6,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgBlueGrandient3,
                              height: 271.v,
                              width: 106.h,
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(top: 31.v),
                            ),
                          ),
                          Opacity(
                            opacity: 0.3,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgYellowGrandient5,
                              height: 271.v,
                              width: 101.h,
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(bottom: 21.v),
                            ),
                          ),
                          Opacity(
                            opacity: 0.6,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgPinkGrandient4,
                              height: 271.v,
                              width: 136.h,
                              alignment: Alignment.topLeft,
                            ),
                          ),
                          _buildFrameSeventeen(context),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 92.h,
                                top: 39.v,
                                right: 82.h,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "lbl_create_account".tr,
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                  SizedBox(height: 2.v),
                                  Opacity(
                                    opacity: 0.8,
                                    child: SizedBox(
                                      width: 255.h,
                                      child: Text(
                                        "msg_it_is_the_first".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: CustomTextStyles
                                            .bodyLargeInterBlack90018,
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
      ),
    );
  }

  /// Section Widget
  Widget _buildNameEditText(BuildContext context) {
    return BlocSelector<CreateaccountBloc, CreateaccountState,
        TextEditingController?>(
      selector: (state) => state.nameEditTextController,
      builder: (context, nameEditTextController) {
        return CustomTextFormField(
          controller: nameEditTextController,
          hintText: "lbl_name".tr,
          validator: (value) {
            if (!isText(value)) {
              return "err_msg_please_enter_valid_text".tr;
            }
            return null;
          },
          contentPadding: EdgeInsets.all(10.h),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildSurnameEditText(BuildContext context) {
    return BlocSelector<CreateaccountBloc, CreateaccountState,
        TextEditingController?>(
      selector: (state) => state.surnameEditTextController,
      builder: (context, surnameEditTextController) {
        return CustomTextFormField(
          controller: surnameEditTextController,
          hintText: "lbl_surname".tr,
          validator: (value) {
            if (!isText(value)) {
              return "err_msg_please_enter_valid_text".tr;
            }
            return null;
          },
          contentPadding: EdgeInsets.all(10.h),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildSurnameEditText2(BuildContext context) {
    return BlocSelector<CreateaccountBloc, CreateaccountState,
        TextEditingController?>(
      selector: (state) => state.surnameEditText2Controller,
      builder: (context, surnameEditText2Controller) {
        return CustomTextFormField(
          controller: surnameEditText2Controller,
          hintText: "lbl_second_surname".tr,
          validator: (value) {
            if (!isText(value)) {
              return "err_msg_please_enter_valid_text".tr;
            }
            return null;
          },
          contentPadding: EdgeInsets.all(10.h),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildMailValueEditText(BuildContext context) {
    return BlocSelector<CreateaccountBloc, CreateaccountState,
        TextEditingController?>(
      selector: (state) => state.mailValueEditTextController,
      builder: (context, mailValueEditTextController) {
        return CustomTextFormField(
          controller: mailValueEditTextController,
          hintText: "lbl_mail".tr,
          contentPadding: EdgeInsets.all(10.h),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPasswordEditText(BuildContext context) {
    return BlocBuilder<CreateaccountBloc, CreateaccountState>(
      builder: (context, state) {
        return CustomTextFormField(
          controller: state.passwordEditTextController,
          hintText: "lbl_password".tr,
          textInputType: TextInputType.visiblePassword,
          suffix: InkWell(
            onTap: () {
              context.read<CreateaccountBloc>().add(
                  ChangePasswordVisibilityEvent(value: !state.isShowPassword));
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
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: state.isShowPassword,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildConfirmPasswordEditText(BuildContext context) {
    return BlocBuilder<CreateaccountBloc, CreateaccountState>(
      builder: (context, state) {
        return CustomTextFormField(
          controller: state.confirmPasswordEditTextController,
          hintText: "msg_confirm_password".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: InkWell(
            onTap: () {
              context.read<CreateaccountBloc>().add(
                  ChangePasswordVisibilityEvent1(
                      value: !state.isShowPassword1));
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
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: state.isShowPassword1,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(
      width: 185.h,
      text: "lbl_continue".tr,
    );
  }

  /// Section Widget
  Widget _buildFrameSeventeen(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 42.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNameEditText(context),
            SizedBox(height: 13.v),
            _buildSurnameEditText(context),
            SizedBox(height: 13.v),
            _buildSurnameEditText2(context),
            SizedBox(height: 13.v),
            _buildMailValueEditText(context),
            SizedBox(height: 13.v),
            _buildPasswordEditText(context),
            SizedBox(height: 13.v),
            _buildConfirmPasswordEditText(context),
            SizedBox(height: 32.v),
            _buildContinueButton(context),
          ],
        ),
      ),
    );
  }
}
