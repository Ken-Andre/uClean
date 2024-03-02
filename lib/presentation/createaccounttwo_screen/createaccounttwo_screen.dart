import 'package:ucleankim/widgets/custom_pin_code_text_field.dart';
import 'package:ucleankim/widgets/custom_elevated_button.dart';
import 'models/createaccounttwo_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/createaccounttwo_bloc.dart';

class CreateaccounttwoScreen extends StatelessWidget {
  const CreateaccounttwoScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<CreateaccounttwoBloc>(
      create: (context) => CreateaccounttwoBloc(CreateaccounttwoState(
        createaccounttwoModelObj: CreateaccounttwoModel(),
      ))
        ..add(CreateaccounttwoInitialEvent()),
      child: CreateaccounttwoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: 812.v,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 110.v),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Opacity(
                opacity: 0.6,
                child: CustomImageView(
                  imagePath: ImageConstant.imgBlueGrandient271x96,
                  height: 271.v,
                  width: 96.h,
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 31.v),
                ),
              ),
              Opacity(
                opacity: 0.3,
                child: CustomImageView(
                  imagePath: ImageConstant.imgYellowGrandient271x92,
                  height: 271.v,
                  width: 92.h,
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(bottom: 5.v),
                ),
              ),
              Opacity(
                opacity: 0.6,
                child: CustomImageView(
                  imagePath: ImageConstant.imgPinkGrandient271x124,
                  height: 271.v,
                  width: 124.h,
                  alignment: Alignment.topLeft,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 54.h,
                    right: 52.h,
                    bottom: 89.v,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "msg_verify_your_account".tr,
                        style: theme.textTheme.headlineSmall,
                      ),
                      SizedBox(height: 16.v),
                      SizedBox(
                        width: 286.h,
                        child: Text(
                          "msg_write_the_code_that2".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(height: 28.v),
                      Text(
                        "msg_dragondisdex_live_com".tr,
                        style: CustomTextStyles.titleMediumInter_1,
                      ),
                      SizedBox(height: 27.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 34.h),
                        child: BlocSelector<CreateaccounttwoBloc,
                            CreateaccounttwoState, TextEditingController?>(
                          selector: (state) => state.otpController,
                          builder: (context, otpController) {
                            return CustomPinCodeTextField(
                              context: context,
                              controller: otpController,
                              onChanged: (value) {
                                otpController?.text = value;
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 29.v),
                      CustomElevatedButton(
                        width: 185.h,
                        text: "lbl_continue".tr,
                      ),
                    ],
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgGroupOrange200,
                height: 186.adaptSize,
                width: 186.adaptSize,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 16.v),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
