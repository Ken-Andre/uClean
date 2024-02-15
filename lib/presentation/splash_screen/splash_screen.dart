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
                  margin: EdgeInsets.only(top: 2.v),
                  child: _buildSplashGradient(context))));
    });
  }

  /// Section Widget
  Widget _buildSplashGradient(BuildContext context) {
    return SizedBox(
        height: 374.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.centerRight, children: [
          Align(alignment: Alignment.topLeft, child: SizedBox(height: 271.v)),
          Align(
              alignment: Alignment.centerRight, child: SizedBox(height: 271.v)),
          Align(
              alignment: Alignment.bottomLeft, child: SizedBox(height: 271.v)),
          CustomImageView(
              imagePath: ImageConstant.imgLogo,
              height: 104.v,
              width: 259.h,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 61.h))
        ]));
  }
}
