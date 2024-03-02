import 'package:ucleankim/widgets/custom_elevated_button.dart';
import 'models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/onboarding_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
        create: (context) => OnboardingBloc(
            OnboardingState(onboardingModelObj: OnboardingModel()))
          ..add(OnboardingInitialEvent()),
        child: OnboardingScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 50.v),
                  child: Column(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgThePhotoHighl113x353,
                        height: 363.adaptSize,
                        width: 363.adaptSize),
                    SizedBox(height: 9.v),
                    Text("msg_welcome_to_uclean".tr,
                        style: theme.textTheme.titleLarge),
                    SizedBox(height: 11.v),
                    Container(
                        width: 347.h,
                        margin: EdgeInsets.only(left: 7.h, right: 8.h),
                        child: Text("msg_your_sustainable".tr,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style:
                                CustomTextStyles.bodyLargePoppinsBlack900_2)),
                    SizedBox(height: 97.v),
                    CustomElevatedButton(
                        height: 50.v,
                        text: "lbl_next".tr,
                        buttonStyle:
                            CustomButtonStyles.fillOnSecondaryContainer,
                        onPressed: () {
                          navigatetoLogin(context);
                        }),
                    SizedBox(height: 5.v)
                  ]))));
    });
  }

  /// Navigates to the loginScreen when the action is triggered.
  navigatetoLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
