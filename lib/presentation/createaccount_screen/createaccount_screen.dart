import 'bloc/createaccount_bloc.dart';
import 'models/createaccount_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/core/utils/validation_functions.dart';
import 'package:uclean/widgets/custom_checkbox_button.dart';
import 'package:uclean/widgets/custom_elevated_button.dart';
import 'package:uclean/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CreateaccountScreen extends StatelessWidget {
  CreateaccountScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<CreateaccountBloc>(
        create: (context) => CreateaccountBloc(
            CreateaccountState(createaccountModelObj: CreateaccountModel()))
          ..add(CreateaccountInitialEvent()),
        child: CreateaccountScreen());
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
                      SizedBox(height: 150.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                                  height: 583.v,
                                  width: 430.h,
                                  margin: EdgeInsets.only(bottom: 199.v),
                                  child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Opacity(
                                            opacity: 0.6,
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgBlueGrandient3,
                                                height: 271.v,
                                                width: 106.h,
                                                alignment: Alignment.topRight,
                                                margin: EdgeInsets.only(
                                                    top: 31.v))),
                                        Opacity(
                                            opacity: 0.3,
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgYellowGrandient5,
                                                height: 271.v,
                                                width: 101.h,
                                                alignment: Alignment.bottomLeft,
                                                margin: EdgeInsets.only(
                                                    bottom: 61.v))),
                                        Opacity(
                                            opacity: 0.6,
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgPinkGrandient5,
                                                height: 271.v,
                                                width: 136.h,
                                                alignment: Alignment.topLeft)),
                                        _buildFrameSeventeen(context),
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 92.h,
                                                    top: 5.v,
                                                    right: 82.h),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                          "lbl_create_account"
                                                              .tr,
                                                          style: theme.textTheme
                                                              .headlineSmall),
                                                      SizedBox(height: 2.v),
                                                      Opacity(
                                                          opacity: 0.8,
                                                          child: SizedBox(
                                                              width: 255.h,
                                                              child: Text(
                                                                  "msg_it_is_the_first"
                                                                      .tr,
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: CustomTextStyles
                                                                      .bodyLargeInterBlack90018)))
                                                    ])))
                                      ]))))
                    ])))));
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
              contentPadding: EdgeInsets.all(10.h));
        });
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
              contentPadding: EdgeInsets.all(10.h));
        });
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
              contentPadding: EdgeInsets.all(10.h));
        });
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
              contentPadding: EdgeInsets.all(10.h));
        });
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
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: state.isShowPassword);
    });
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
                      width: 19.h))),
          suffixConstraints: BoxConstraints(maxHeight: 44.v),
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: state.isShowPassword1);
    });
  }

  /// Section Widget
  Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(
        width: 185.h,
        text: "lbl_continue".tr,
        onPressed: () {
          createAccountcall(context);
        });
  }

  /// Section Widget
  Widget _buildFrameSeventeen(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.h),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
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
              SizedBox(height: 14.v),
              Padding(
                  padding: EdgeInsets.only(left: 17.h, right: 15.h),
                  child: BlocSelector<CreateaccountBloc, CreateaccountState,
                          bool?>(
                      selector: (state) => state.acceptAllTermsAndConditions,
                      builder: (context, acceptAllTermsAndConditions) {
                        return CustomCheckboxButton(
                            text: "msg_accept_all_terms".tr,
                            value: acceptAllTermsAndConditions,
                            onChange: (value) {
                              context
                                  .read<CreateaccountBloc>()
                                  .add(ChangeCheckBoxEvent(value: value));
                            });
                      })),
              SizedBox(height: 30.v),
              _buildContinueButton(context)
            ])));
  }

  /// Calls the {{baseUrl}}/user/register API and triggers a [CreateRegisterEvent] event on the [CreateaccountBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateRegisterEvent] event on the [CreateaccountBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  createAccountcall(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<CreateaccountBloc>().add(
            CreateRegisterEvent(
              onCreateRegisterEventSuccess: () {
                _onPostRegisterEventSuccess(context);
              },
              onCreateRegisterEventError: () {
                _onPostRegisterEventError(context);
              },
            ),
          );
    }
  }

  /// Navigates to the loginScreen when the action is triggered.
  void _onPostRegisterEventSuccess(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  void _onPostRegisterEventError(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
