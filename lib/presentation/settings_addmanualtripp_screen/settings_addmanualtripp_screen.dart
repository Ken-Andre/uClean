import 'package:ucleankim/widgets/app_bar/custom_app_bar.dart';
import 'package:ucleankim/widgets/app_bar/appbar_leading_image.dart';
import 'package:ucleankim/widgets/app_bar/appbar_subtitle.dart';
import 'package:ucleankim/core/utils/validation_functions.dart';
import 'package:ucleankim/widgets/custom_text_form_field.dart';
import 'package:ucleankim/widgets/custom_drop_down.dart';
import 'models/settings_addmanualtripp_model.dart';
import 'package:ucleankim/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';
import 'bloc/settings_addmanualtripp_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore_for_file: must_be_immutable
class SettingsAddmanualtrippScreen extends StatelessWidget {
  SettingsAddmanualtrippScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsAddmanualtrippBloc>(
        create: (context) => SettingsAddmanualtrippBloc(
            SettingsAddmanualtrippState(
                settingsAddmanualtrippModelObj: SettingsAddmanualtrippModel()))
          ..add(SettingsAddmanualtrippInitialEvent()),
        child: SettingsAddmanualtrippScreen());
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
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 19.h, vertical: 15.v),
                            child: Column(children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(children: [
                                      Text("lbl_detailed".tr,
                                          style: CustomTextStyles.bodyMedium15),
                                      SizedBox(
                                          width: 50.h,
                                          child: Divider(
                                              color: theme.colorScheme
                                                  .onSecondaryContainer
                                                  .withOpacity(1)))
                                    ]),
                                    GestureDetector(
                                        onTap: () {
                                          navigatetoResTrip(context);
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 7.h),
                                            child: Column(children: [
                                              Text("lbl_resume".tr,
                                                  style: CustomTextStyles
                                                      .bodyMedium15),
                                              SizedBox(
                                                  width: 50.h, child: Divider())
                                            ])))
                                  ]),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("lbl_date_and_hour".tr,
                                      style: theme.textTheme.titleSmall)),
                              SizedBox(height: 12.v),
                              _buildWedJanuary3(context),
                              SizedBox(height: 3.v),
                              _buildOneThousandTwentyEight(context),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("lbl_address".tr,
                                      style: theme.textTheme.titleSmall)),
                              SizedBox(height: 12.v),
                              _buildStartLocation(context),
                              SizedBox(height: 3.v),
                              _buildStopLocation(context),
                              SizedBox(height: 1.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("lbl_trip_mode".tr,
                                      style: theme.textTheme.titleSmall)),
                              SizedBox(height: 10.v),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.h),
                                  child: BlocSelector<
                                          SettingsAddmanualtrippBloc,
                                          SettingsAddmanualtrippState,
                                          SettingsAddmanualtrippModel?>(
                                      selector: (state) =>
                                          state.settingsAddmanualtrippModelObj,
                                      builder: (context,
                                          settingsAddmanualtrippModelObj) {
                                        return CustomDropDown(
                                            hintText: "lbl_car".tr,
                                            hintStyle: CustomTextStyles
                                                .bodyMediumLight,
                                            items:
                                                settingsAddmanualtrippModelObj
                                                        ?.dropdownItemList ??
                                                    [],
                                            // contentPadding: EdgeInsets.only(
                                            //     top: 9.v, bottom: 11.v),
                                            onChanged: (value) {
                                              context
                                                  .read<
                                                      SettingsAddmanualtrippBloc>()
                                                  .add(ChangeDropDownEvent(
                                                      value: value));
                                            });
                                      }))
                            ]))))),
            bottomNavigationBar: _buildFrameNinetySix(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 29.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 23.h, top: 20.v, bottom: 24.v)),
        centerTitle: true,
        title: AppbarSubtitle(text: "msg_add_a_manual_trip".tr));
  }

  /// Section Widget
  Widget _buildWedJanuary3(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: BlocSelector<SettingsAddmanualtrippBloc,
                SettingsAddmanualtrippState, TextEditingController?>(
            selector: (state) => state.wedJanuary3Controller,
            builder: (context, wedJanuary3Controller) {
              return CustomTextFormField(
                  controller: wedJanuary3Controller,
                  hintText: "lbl_wed_january_31".tr,
                  hintStyle: CustomTextStyles.bodyMediumLight,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(97.h, 11.v, 9.h, 11.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgCalendar,
                          height: 20.v,
                          width: 18.h)),
                  prefixConstraints: BoxConstraints(maxHeight: 42.v),
                  validator: (value) {
                    if (value == null || (!Date(value, isRequired: true))) {
                      return "err_msg_enter_valid_date_in_dd_mm_yyyy".tr;
                    }
                    return null;
                  },
                  contentPadding: EdgeInsets.only(top: 11.v, bottom: 9.v),
                  borderDecoration: TextFormFieldStyleHelper.fillWhiteA,
                  fillColor: theme.colorScheme.primary);
            }));
  }

  /// Section Widget
  Widget _buildOneThousandTwentyEight(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: BlocSelector<SettingsAddmanualtrippBloc,
                SettingsAddmanualtrippState, TextEditingController?>(
            selector: (state) => state.oneThousandTwentyEightController,
            builder: (context, oneThousandTwentyEightController) {
              return CustomTextFormField(
                  controller: oneThousandTwentyEightController,
                  hintText: "lbl_10_28".tr,
                  hintStyle: CustomTextStyles.bodyMediumLight,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(136.h, 14.v, 10.h, 15.v),
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
                  borderDecoration: TextFormFieldStyleHelper.fillWhiteA,
                  fillColor: theme.colorScheme.primary);
            }));
  }

  /// Section Widget
  Widget _buildStartLocation(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: BlocSelector<SettingsAddmanualtrippBloc,
                SettingsAddmanualtrippState, TextEditingController?>(
            selector: (state) => state.startLocationController,
            builder: (context, startLocationController) {
              return CustomTextFormField(
                  controller: startLocationController,
                  hintText: "lbl_start_location".tr,
                  hintStyle: CustomTextStyles.bodyMediumLight,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(102.h, 10.v, 9.h, 10.v),
                      child: CustomImageView(
                          imagePath:
                              ImageConstant.img_contrast_secondarycontainer,
                          height: 24.adaptSize,
                          width: 24.adaptSize)),
                  prefixConstraints: BoxConstraints(maxHeight: 44.v),
                  validator: (value) {
                    if (value == null ||
                        (!aggregateCoordonates(value, isRequired: true))) {
                      return "err_msg_enter_lat_and_long_of_the_point_like_this_lat_long"
                          .tr;
                    }
                    return null;
                  },
                  contentPadding: EdgeInsets.only(top: 10.v, bottom: 12.v),
                  borderDecoration: TextFormFieldStyleHelper.fillWhiteA,
                  fillColor: theme.colorScheme.primary);
            }));
  }

  /// Section Widget
  Widget _buildStopLocation(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: BlocSelector<SettingsAddmanualtrippBloc,
                SettingsAddmanualtrippState, TextEditingController?>(
            selector: (state) => state.stopLocationController,
            builder: (context, stopLocationController) {
              return CustomTextFormField(
                  controller: stopLocationController,
                  hintText: "lbl_stop_location".tr,
                  hintStyle: CustomTextStyles.bodyMediumLight,
                  textInputAction: TextInputAction.done,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(102.h, 10.v, 9.h, 10.v),
                      child: CustomImageView(
                          imagePath:
                              ImageConstant.img_contrast_secondarycontainer,
                          height: 24.adaptSize,
                          width: 24.adaptSize)),
                  prefixConstraints: BoxConstraints(maxHeight: 44.v),
                  validator: (value) {
                    if (value == null ||
                        (!aggregateCoordonates(value, isRequired: true))) {
                      return "err_msg_enter_lat_and_long_of_the_point_like_this_lat_long"
                          .tr;
                    }
                    return null;
                  },
                  contentPadding: EdgeInsets.only(top: 12.v, bottom: 10.v),
                  borderDecoration: TextFormFieldStyleHelper.fillWhiteA,
                  fillColor: theme.colorScheme.primary);
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
          callAddDetTrip(context);
        });
  }

  /// Section Widget
  Widget _buildFrameNinetySix(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 8.v),
        decoration: AppDecoration.fillGray,
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

  /// Navigates to the settingsAddmanualtrippresversScreen when the action is triggered.
  navigatetoResTrip(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsAddmanualtrippresversScreen,
    );
  }

  /// Calls the https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/trips_maps API and triggers a [CreateTripsMapsEvent] event on the [SettingsAddmanualtrippBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateTripsMapsEvent] event on the [SettingsAddmanualtrippBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  callAddDetTrip(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<SettingsAddmanualtrippBloc>().add(
            CreateTripsMapsEvent(
              onCreateTripsMapsEventSuccess: () {
                _onCreateTripEventSuccess(context);
              },
              onCreateTripsMapsEventError: () {
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
      msg: "Your Detailed trips successfully sent!",
    );
  }
}
