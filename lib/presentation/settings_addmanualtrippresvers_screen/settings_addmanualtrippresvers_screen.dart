import 'package:ucleankim/widgets/app_bar/custom_app_bar.dart';
import 'package:ucleankim/widgets/app_bar/appbar_leading_image.dart';
import 'package:ucleankim/widgets/app_bar/appbar_subtitle.dart';
import 'package:ucleankim/core/utils/validation_functions.dart';
import 'package:ucleankim/widgets/custom_text_form_field.dart';
import 'package:ucleankim/widgets/custom_drop_down.dart';
import 'models/settings_addmanualtrippresvers_model.dart';
import 'package:ucleankim/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/settings_addmanualtrippresvers_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore_for_file: must_be_immutable
class SettingsAddmanualtrippresversScreen extends StatelessWidget {
  SettingsAddmanualtrippresversScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsAddmanualtrippresversBloc>(
        create: (context) => SettingsAddmanualtrippresversBloc(
            SettingsAddmanualtrippresversState(
                settingsAddmanualtrippresversModelObj:
                SettingsAddmanualtrippresversModel()))
          ..add(SettingsAddmanualtrippresversInitialEvent()),
        child: SettingsAddmanualtrippresversScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.h, vertical: 14.v),
                            child: Column(children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              navigateToDetTrips(context);
                                            },
                                            child: Column(children: [
                                              Text("lbl_detailed".tr,
                                                  style: CustomTextStyles
                                                      .bodyMediumBlack900),
                                              SizedBox(
                                                  width: 50.h, child: Divider())
                                            ])),
                                        SizedBox(
                                            width: 50.h,
                                            child: Divider(color: appTheme.whiteA70001))
                                      ],
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 7.h),
                                        child: Column(children: [
                                          Text("lbl_resume".tr,
                                              style: CustomTextStyles
                                                  .bodyMediumBlack900),
                                          SizedBox(
                                              width: 50.h,
                                              child: Divider(
                                                  color: theme.colorScheme
                                                      .onSecondaryContainer
                                                      .withOpacity(1)))
                                        ]))
                                  ]),
                              SizedBox(height: 2.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("lbl_date_and_hour".tr,
                                      style: theme.textTheme.titleSmall)),
                              SizedBox(height: 12.v),
                              _buildWedJanuary31(context),
                              SizedBox(height: 3.v),
                              _buildOneThousandTwentyEight(context),
                              SizedBox(height: 2.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("msg_number_of_kilometers".tr,
                                      style: theme.textTheme.titleSmall)),
                              SizedBox(height: 12.v),
                              _buildKm(context),
                              SizedBox(height: 4.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("lbl_trip_mode".tr,
                                      style: theme.textTheme.titleSmall)),
                              SizedBox(height: 10.v),
                              Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 9.h),
                                      child: BlocSelector<
                                          SettingsAddmanualtrippresversBloc,
                                          SettingsAddmanualtrippresversState,
                                          SettingsAddmanualtrippresversModel?>(
                                          selector: (state) => state
                                              .settingsAddmanualtrippresversModelObj,
                                          builder: (context,
                                              settingsAddmanualtrippresversModelObj) {
                                            return CustomDropDown(
                                                hintText: "lbl_car".tr,
                                                hintStyle: CustomTextStyles
                                                    .bodyMediumLight,
                                                items:
                                                settingsAddmanualtrippresversModelObj
                                                    ?.dropdownItemList ??
                                                    [],
                                                // contentPadding: EdgeInsets.only(
                                                //     top: 9.v, bottom: 11.v),
                                                onChanged: (value) {
                                                  context
                                                      .read<
                                                      SettingsAddmanualtrippresversBloc>()
                                                      .add(ChangeDropDownEvent(
                                                      value: value));
                                                });
                                          }))
                            ]))))),
            bottomNavigationBar: _buildFrameNinetyFive(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 29.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 23.h, top: 20.v, bottom: 24.v),
            onTap: () {
              onBackPressed(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "msg_add_a_manual_trip".tr));
  }

  /// Section Widget
  Widget _buildWedJanuary31(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.h, right: 9.h),
        child: BlocSelector<SettingsAddmanualtrippresversBloc,
            SettingsAddmanualtrippresversState, TextEditingController?>(
            selector: (state) => state.wedJanuary31Controller,
            builder: (context, wedJanuary31Controller) {
              return CustomTextFormField(
                  controller: wedJanuary31Controller,
                  hintText: "lbl_wed_january_31".tr,
                  hintStyle: CustomTextStyles.bodyMediumBlack900Light_1,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(97.h, 11.v, 9.h, 11.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgCalendar,
                          height: 20.v,
                          width: 18.h)),
                  prefixConstraints: BoxConstraints(maxHeight: 42.v),
                  validator: (value) {
                    if (value == null || (!Date(value, isRequired: true))) {
                      return "err_msg_enter_valid_date_in_mm_dd_yyyy".tr;
                    }
                    return null;
                  },
                  contentPadding: EdgeInsets.only(top: 11.v, bottom: 9.v),
                  // borderDecoration: TextFormFieldStyleHelper.fillPrimaryTL5,
                  fillColor: theme.colorScheme.primary);
            }));
  }

  /// Section Widget
  Widget _buildOneThousandTwentyEight(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.h, right: 9.h),
        child: BlocSelector<SettingsAddmanualtrippresversBloc,
            SettingsAddmanualtrippresversState, TextEditingController?>(
            selector: (state) => state.oneThousandTwentyEightController,
            builder: (context, oneThousandTwentyEightController) {
              return CustomTextFormField(
                  controller: oneThousandTwentyEightController,
                  hintText: "lbl_10_28".tr,
                  hintStyle: CustomTextStyles.bodyMediumBlack900Light_1,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(135.h, 14.v, 10.h, 15.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgClock,
                          height: 20.adaptSize,
                          width: 20.adaptSize)),
                  prefixConstraints: BoxConstraints(maxHeight: 49.v),
                  validator: (value) {
                    if (value == null || (!hour(value, isRequired: true))) {
                      return "err_msg_enter_a_good_hour_hh_mm".tr;
                    }
                    return null;
                  },
                  contentPadding: EdgeInsets.only(top: 13.v, bottom: 14.v),
                  // borderDecoration: TextFormFieldStyleHelper.fillPrimaryTL5,
                  fillColor: theme.colorScheme.primary);
            }));
  }

  /// Section Widget
  Widget _buildKm(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.h, right: 9.h),
        child: BlocSelector<SettingsAddmanualtrippresversBloc,
            SettingsAddmanualtrippresversState, TextEditingController?>(
            selector: (state) => state.kmController,
            builder: (context, kmController) {
              return CustomTextFormField(
                  controller: kmController,
                  hintText: "lbl_km".tr,
                  hintStyle: CustomTextStyles.bodyMediumBlack900_1,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null ||
                        (!isNumeric(value, isRequired: true))) {
                      return "err_msg_please_enter_valid_number".tr;
                    }
                    return null;
                  },
                  // borderDecoration: TextFormFieldStyleHelper.fillPrimaryTL5
              );
            }));
  }

  /// Section Widget
  Widget _buildAddDrive(BuildContext context) {
    return CustomElevatedButton(
        height: 26.v,
        width: 87.h,
        text: "lbl_add_drive".tr,
        margin: EdgeInsets.only(top: 10.v, bottom: 11.v),
        buttonStyle: CustomButtonStyles.outlineBlack,
        buttonTextStyle: CustomTextStyles.bodyMediumPrimary,
        onPressed: () {
          callAddResTrips(context);
        });
  }

  /// Section Widget
  Widget _buildFrameNinetyFive(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 8.v),
        decoration: AppDecoration.outlineGrayF,
        child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(bottom: 1.v),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_9999".tr, style: theme.textTheme.titleSmall),
                    Padding(
                        padding: EdgeInsets.only(top: 2.v),
                        child: Text("lbl_kilometers".tr,
                            style: theme.textTheme.bodyMedium))
                  ])),
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("lbl_professional".tr, style: theme.textTheme.titleSmall),
                Padding(
                    padding: EdgeInsets.only(top: 3.v),
                    child:
                    Text("lbl_trip".tr, style: theme.textTheme.bodyMedium))
              ]),
          _buildAddDrive(context)
        ]));
  }

  /// Navigates to the previous screen.
  onBackPressed(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the settingsAddmanualtrippScreen when the action is triggered.
  navigateToDetTrips(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsAddmanualtrippScreen,
    );
  }

  /// Calls the https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/trips API and triggers a [CreateTripsEvent] event on the [SettingsAddmanualtrippresversBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateTripsEvent] event on the [SettingsAddmanualtrippresversBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  callAddResTrips(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<SettingsAddmanualtrippresversBloc>().add(
        CreateTripsEvent(
          onCreateTripsEventSuccess: () {
            _onCreateTripEventSuccess(context);
          },
          onCreateTripsEventError: () {
            _onCreateTripEventError(context);
          },
        ),
      );
    }
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  void _onCreateTripEventSuccess(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeContainerScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onCreateTripEventError(BuildContext context) {
    Fluttertoast.showToast(
      msg: "We failed send your trips data. Try again please.",
    );
  }
}
