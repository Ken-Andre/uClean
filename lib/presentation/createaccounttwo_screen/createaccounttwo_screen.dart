import 'bloc/createaccounttwo_bloc.dart';import 'models/createaccounttwo_model.dart';import 'package:flutter/material.dart';import 'package:uclean/core/app_export.dart';import 'package:uclean/widgets/custom_elevated_button.dart';import 'package:uclean/widgets/custom_pin_code_text_field.dart';class CreateaccounttwoScreen extends StatelessWidget {const CreateaccounttwoScreen({Key? key}) : super(key: key);

static Widget builder(BuildContext context) { return BlocProvider<CreateaccounttwoBloc>(create: (context) => CreateaccounttwoBloc(CreateaccounttwoState(createaccounttwoModelObj: CreateaccounttwoModel()))..add(CreateaccounttwoInitialEvent()), child: CreateaccounttwoScreen()); } 
@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, body: SizedBox(width: 430.h, child: Column(children: [SizedBox(height: 110.v), Expanded(child: SingleChildScrollView(child: Container(height: 522.v, width: 430.h, margin: EdgeInsets.only(bottom: 260.v), child: Stack(alignment: Alignment.bottomLeft, children: [Opacity(opacity: 0.6, child: CustomImageView(imagePath: ImageConstant.imgBlueGrandient4, height: 271.v, width: 106.h, alignment: Alignment.topRight, margin: EdgeInsets.only(top: 31.v))), Opacity(opacity: 0.3, child: CustomImageView(imagePath: ImageConstant.imgYellowGrandient6, height: 271.v, width: 101.h, alignment: Alignment.bottomLeft)), Opacity(opacity: 0.6, child: CustomImageView(imagePath: ImageConstant.imgPinkGrandient6, height: 271.v, width: 136.h, alignment: Alignment.topLeft)), Align(alignment: Alignment.bottomLeft, child: Padding(padding: EdgeInsets.only(left: 49.h, right: 95.h, bottom: 20.v), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.end, children: [Padding(padding: EdgeInsets.only(right: 1.h), child: Text("msg_verify_your_account".tr, style: theme.textTheme.headlineSmall)), SizedBox(height: 16.v), SizedBox(width: 285.h, child: Text("msg_write_the_code_that2".tr, maxLines: 2, overflow: TextOverflow.ellipsis, style: theme.textTheme.bodyLarge)), SizedBox(height: 28.v), Padding(padding: EdgeInsets.only(right: 26.h), child: Text("msg_dragondisdex_live_com".tr, style: theme.textTheme.titleMedium)), SizedBox(height: 27.v), Padding(padding: EdgeInsets.only(left: 59.h, right: 9.h), child: BlocSelector<CreateaccounttwoBloc, CreateaccounttwoState, TextEditingController?>(selector: (state) => state.otpController, builder: (context, otpController) {return CustomPinCodeTextField(context: context, controller: otpController, onChanged: (value) {otpController?.text = value;});})), SizedBox(height: 29.v), CustomElevatedButton(width: 185.h, text: "lbl_continue".tr, margin: EdgeInsets.only(right: 25.h), onPressed: () {navigatetoLogin(context);})]))), CustomImageView(imagePath: ImageConstant.imgGroupOrange200, height: 186.adaptSize, width: 186.adaptSize, alignment: Alignment.topCenter, margin: EdgeInsets.only(top: 16.v))]))))])))); } 
/// Calls the {{baseUrl}}/user/forgot-password-token API and triggers a [CreateForgotPasswordTokenEvent] event on the [CreateaccounttwoBloc] bloc.
///
/// The [BuildContext] parameter represents current [BuildContext]
navigatetoLogin(BuildContext context) { context.read<CreateaccounttwoBloc>().add(CreateForgotPasswordTokenEvent(onCreateForgotPasswordTokenEventSuccess: () {

_onPostForgotPasswordTokenEventSuccess(context);
},onCreateForgotPasswordTokenEventError: () {

_onPostForgotPasswordTokenEventError(context);
},),);
 } 
/// Navigates to the homeContainerScreen when the action is triggered.
void _onPostForgotPasswordTokenEventSuccess(BuildContext context) { NavigatorService.pushNamed(AppRoutes.homeContainerScreen, ); } 
/// Displays an alert dialog when the action is triggered.
/// The data is retrieved from the `PostPostForgotPasswordTokenResp` object in the 
///`CreateaccounttwoBloc` using the `context.read()` method from the Flutter framework.
void _onPostForgotPasswordTokenEventError(BuildContext context) { 
showDialog(context: context,builder: (_) => AlertDialog(title: const Text('OTP didn't work'),content: Text(context.read<CreateaccounttwoBloc>().postPostForgotPasswordTokenResp.token.toString() ?? ''),actions: [TextButton(onPressed: () {Navigator.pop(context);},child: const Text('Ok'))],)); } 
 }
