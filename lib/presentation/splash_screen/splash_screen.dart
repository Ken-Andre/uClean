import 'models/splash_model.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
        create: (context) =>
            SplashBloc(SplashState(splashModelObj: SplashModel()))
              ..add(SplashInitialEvent()),
        child: SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite, child: _buildGradient(context))));
    });
  }

  /// Section Widget
  Widget _buildGradient(BuildContext context) {
    return SizedBox(
        height: 374.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.centerRight, children: [
          Opacity(
              opacity: 0.6,
              child: CustomImageView(
                  imagePath: ImageConstant.imgPinkGrandient,
                  height: 271.v,
                  width: 253.h,
                  alignment: Alignment.topLeft)),
          Opacity(
              opacity: 0.6,
              child: CustomImageView(
                  imagePath: ImageConstant.imgBlueGrandient,
                  height: 271.v,
                  width: 253.h,
                  alignment: Alignment.centerRight)),
          Opacity(
              opacity: 0.3,
              child: CustomImageView(
                  imagePath: ImageConstant.imgYellowGrandient,
                  height: 271.v,
                  width: 253.h,
                  alignment: Alignment.bottomLeft)),
          CustomImageView(
              imagePath: ImageConstant.imgLogo,
              height: 104.v,
              width: 259.h,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 61.h))
        ]));
  }
}
