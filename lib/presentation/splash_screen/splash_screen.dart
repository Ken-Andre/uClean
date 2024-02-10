import 'bloc/splash_bloc.dart';
import 'models/splash_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';

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
              body: Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(top: 200.v),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 5.v),
                        _buildSplashGradient(context)
                      ]))));
    });
  }

  /// Section Widget
  Widget _buildSplashGradient(BuildContext context) {
    return SizedBox(
        height: 374.v,
        width: 392.h,
        child: Stack(alignment: Alignment.centerRight, children: [
          Opacity(
              opacity: 0.6,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      height: 271.adaptSize,
                      width: 271.adaptSize,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment(0.5, 0.5),
                              end: Alignment(0.5, 1),
                              colors: [
                            appTheme.deepOrange20090,
                            appTheme.deepOrange10090
                          ]))))),
          Opacity(
              opacity: 0.6,
              child: CustomImageView(
                  imagePath: ImageConstant.imgBlueGrandient,
                  height: 271.v,
                  width: 234.h,
                  alignment: Alignment.centerRight)),
          Opacity(
              opacity: 0.3,
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                      height: 271.adaptSize,
                      width: 271.adaptSize,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment(0.5, 0.5),
                              end: Alignment(0.5, 1),
                              colors: [
                            appTheme.yellowA20075,
                            appTheme.limeA40075
                          ]))))),
          CustomImageView(
              imagePath: ImageConstant.imgLogo,
              height: 104.v,
              width: 259.h,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 54.h))
        ]));
  }
}
