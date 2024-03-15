import 'package:dots_indicator/dots_indicator.dart';
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
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      BlocSelector<OnboardingBloc, OnboardingState, PageController?>(
                          selector: (state) => state.pageController,
                          builder: (context, pageController) {
                        return PageView(
                          onPageChanged: (index) {
                            state.onboardingModelObj?.page = index;
                            print("The index $index and ${state.onboardingModelObj?.page}");
                            BlocProvider.of<OnboardingBloc>(context).add(UpdatePageViewEvent(page: index));
                          },
                          controller: pageController,
                          children: [
                            _page(
                                1,
                                context,
                                "msg_welcome_to_uclean".tr,
                                "msg_your_sustainable".tr,
                                "lbl_next".tr,
                                ImageConstant.imgReading,
                                state.pageController),
                            _page(
                                2,
                                context,
                                "msg_track_your_journey".tr,
                                "msg_log_your_trips".tr,
                                "lbl_next".tr,
                                ImageConstant.imgBoy,
                                state.pageController),
                            _page(
                                3,
                                context,
                                "msg_monitor_your_impact".tr,
                                "msg_keeps_tabs_on".tr,
                                "lbl_start".tr,
                                ImageConstant.imgMan,
                                state.pageController),
                          ],
                        );
                      }),
                      Positioned(
                        bottom: 95.h,
                          child: BlocSelector<OnboardingBloc, OnboardingState, int?>(
                              selector: (state) =>
                              state.onboardingModelObj?.page,
                              builder: (context, page) {
                                return DotsIndicator(
                                    position: page ?? 0,
                                    dotsCount: 3,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    decorator: DotsDecorator(
                                      activeColor: appTheme.blueA400,
                                      size: const Size.square(8.0),
                                      activeSize: const Size(10.0, 8.0),
                                      activeShape: RoundedRectangleBorder(
                                          borderRadius: BorderRadiusStyle.roundedBorder5
                                      ),
                                    )
                                );
                              })
                          ),
                    ],
                  )
              )));
    });
  }

  Widget _page(int index, BuildContext context, String title, String subtitle, String buttonName, String imagePath, [PageController? pageControllerp])  {
    return Column(children: [
      CustomImageView(
          imagePath: imagePath, 
          //ImageConstant.imgThePhotoHighl113x353,
          height: 363.adaptSize,
          width: 363.adaptSize),
      SizedBox(height: 9.v),
      Text(title,
          style: theme.textTheme.titleLarge),
      SizedBox(height: 11.v),
      Container(
          width: 347.h,
          margin: EdgeInsets.only(left: 7.h, right: 8.h),
          child: Text(subtitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style:
              CustomTextStyles.bodyLargePoppinsBlack900_2)),
      SizedBox(height: 97.v),
      CustomElevatedButton(
          height: 50.v,
          width: 325.h,
          text: buttonName,
          buttonStyle:
          CustomButtonStyles.fillOnSecondaryContainer,
          onPressed: () {
            navigatetoLogin(context, index, pageControllerp);
          }),
      SizedBox(height: 5.v)
    ]);
  }

  /// Navigates to the loginScreen when the action is triggered.
  navigatetoLogin(BuildContext context, int index, PageController? pageControllerf) {
    if(index<3){
       pageControllerf?.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn);
    } else {
      NavigatorService.pushNamed(
        AppRoutes.loginScreen,
      );
    }
  }
}
