import 'package:ucleankim/core/utils/validation_functions.dart';
import 'package:ucleankim/widgets/custom_text_form_field.dart';
import 'package:ucleankim/widgets/custom_elevated_button.dart';
import 'models/createaccount_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/createaccount_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                                          imagePath: ImageConstant
                                              .imgBlueGrandient271x87,
                                          height: 271.v,
                                          width: 87.h,
                                          alignment: Alignment.topRight,
                                          margin: EdgeInsets.only(top: 31.v))),
                                  Opacity(
                                      opacity: 0.3,
                                      child: CustomImageView(
                                          imagePath: ImageConstant
                                              .imgYellowGrandient271x83,
                                          height: 271.v,
                                          width: 83.h,
                                          alignment: Alignment.bottomLeft,
                                          margin:
                                              EdgeInsets.only(bottom: 5.v))),
                                  Opacity(
                                      opacity: 0.6,
                                      child: CustomImageView(
                                          imagePath: ImageConstant
                                              .imgPinkGrandient271x118,
                                          height: 271.v,
                                          width: 118.h,
                                          alignment: Alignment.topLeft)),
                                  _buildFrameSeventeen(context),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 71.h, right: 59.h),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text("lbl_create_account".tr,
                                                    style: CustomTextStyles
                                                        .headlineSmallPoppins_1),
                                                SizedBox(height: 4.v),
                                                Opacity(
                                                    opacity: 0.8,
                                                    child: SizedBox(
                                                        width: 262.h,
                                                        child: Text(
                                                            "msg_it_is_the_first"
                                                                .tr,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: CustomTextStyles
                                                                .bodyLargeBlack900)))
                                              ])))
                                ])))))));
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context) {
    return BlocSelector<CreateaccountBloc, CreateaccountState,
            TextEditingController?>(
        selector: (state) => state.userNameController,
        builder: (context, userNameController) {
          return CustomTextFormField(
              controller: userNameController,
              hintText: "lbl_username".tr,
              validator: (value) {
                if (!isText(value) || value!.length<3) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              },
              contentPadding: EdgeInsets.all(10.h));
        });
  }

  /// Section Widget
  Widget _buildMailInput(BuildContext context) {
    return BlocSelector<CreateaccountBloc, CreateaccountState,
            TextEditingController?>(
        selector: (state) => state.mailInputController,
        builder: (context, mailInputController) {
          return CustomTextFormField(
              controller: mailInputController,
              hintText: "lbl_mail".tr,
              validator: (value) {
                if (value == null ||
                    (!UcacIcamandIcam(value, isRequired: true))) {
                  return "err_msg_enter_your_school_address_".tr;
                }
                return null;
              },
              contentPadding: EdgeInsets.all(10.h));
        });
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return BlocBuilder<CreateaccountBloc, CreateaccountState>(
        builder: (context, state) {
      return CustomTextFormField(
          controller: state.passwordController,
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
  Widget _buildConfirmpassword(BuildContext context) {
    return BlocBuilder<CreateaccountBloc, CreateaccountState>(
        builder: (context, state) {
      return CustomTextFormField(
          controller: state.confirmpasswordController,
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
            if (value == null || state.passwordController?.text !=value) { //!isValidPassword(value)
              return "err_msg_please_password_not_match".tr;
            }
            return null;
          },
          obscureText: state.isShowPassword1);
    });
  }

  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return CustomElevatedButton(
        width: 185.h,
        text: "lbl_continue".tr,
        onPressed: () {
          callCreateAccountcall(context);
        });
  }

  /// Section Widget
  Widget _buildFrameSeventeen(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.only(left: 23.h, right: 23.h, bottom: 51.v),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              _buildUserName(context),
              SizedBox(height: 13.v),
              _buildMailInput(context),
              SizedBox(height: 13.v),
              _buildPassword(context),
              SizedBox(height: 13.v),
              _buildConfirmpassword(context),
              SizedBox(height: 15.v),
              Text("msg_by_signing_up_you3".tr,
                  style: CustomTextStyles.bodyLarge18),
              SizedBox(height: 3.v),
              GestureDetector(
                  onTap: () {
                    openTermandConditionsURL(context);
                  },
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "lbl_terms".tr,
                            style: CustomTextStyles.bodyLargeff000000.copyWith(
                                decoration: TextDecoration.underline)),
                        TextSpan(
                            text: "lbl_and".tr,
                            style: CustomTextStyles.bodyLargeff000000),
                        TextSpan(
                            text: "lbl_conditions".tr,
                            style: CustomTextStyles.bodyLargeff000000
                                .copyWith(decoration: TextDecoration.underline))
                      ]),
                      textAlign: TextAlign.left)),
              SizedBox(height: 31.v),
              _buildContinue(context)
            ])));
  }

  /// Opens a URL in the device's default web browser.
  ///
  /// The [context] parameter is the `BuildContext` of the widget that invoked the function.
  ///
  /// Throws an exception if the URL could not be launched.
  openTermandConditionsURL(BuildContext context) async {
    var url = 'https://support.discord.com/hc/en-us';
    if (!await launchUrlString(url)) {
      throw 'Could not launch https://support.discord.com/hc/en-us';
    }
  }

  /// Calls the https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/signup API and triggers a [CreateSignupEvent] event on the [CreateaccountBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateSignupEvent] event on the [CreateaccountBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  callCreateAccountcall(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<CreateaccountBloc>().add(
            CreateSignupEvent(
              onCreateSignupEventSuccess: () {
                _onSignupPostEventSuccess(context);
              },
              onCreateSignupEventError: () {
                _onSignupPostEventError(context);
              },
            ),
          );
    }
  }

  /// Navigates to the createaccountthreeScreen when the action is triggered.
  void _onSignupPostEventSuccess(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Your Account Successfully created !",
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
    );
    NavigatorService.pushNamed(
      AppRoutes.createaccountthreeScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onSignupPostEventError(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Maybe not connected, or something gone wrong!",
      timeInSecForIosWeb: 5,
    );
  }
}
