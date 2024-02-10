import 'bloc/settingsautotrack_bloc.dart';
import 'models/settingsautotrack_model.dart';
import 'package:flutter/material.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/widgets/app_bar/appbar_leading_image.dart';
import 'package:uclean/widgets/app_bar/appbar_subtitle.dart';
import 'package:uclean/widgets/app_bar/custom_app_bar.dart';
import 'package:uclean/widgets/custom_switch.dart';

class SettingsautotrackScreen extends StatelessWidget {
  const SettingsautotrackScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsautotrackBloc>(
        create: (context) => SettingsautotrackBloc(SettingsautotrackState(
            settingsautotrackModelObj: SettingsautotrackModel()))
          ..add(SettingsautotrackInitialEvent()),
        child: SettingsautotrackScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.red50,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 1.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_tracking_times".tr,
                          style: theme.textTheme.titleSmall)),
                  SizedBox(height: 3.v),
                  _buildFrameEightyOne(context),
                  SizedBox(height: 1.v),
                  _buildTabSubsection(context),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 29.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 23.h, top: 20.v, bottom: 24.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_auto_tracking".tr));
  }

  /// Section Widget
  Widget _buildFrameEightyOne(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 9.h),
        padding: EdgeInsets.symmetric(horizontal: 42.h, vertical: 6.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 4.v),
              child: Text("msg_only_track_within".tr,
                  style: theme.textTheme.bodyMedium)),
          BlocSelector<SettingsautotrackBloc, SettingsautotrackState, bool?>(
              selector: (state) => state.isSelectedSwitch,
              builder: (context, isSelectedSwitch) {
                return CustomSwitch(
                    margin: EdgeInsets.only(top: 1.v),
                    value: isSelectedSwitch,
                    onChange: (value) {
                      context
                          .read<SettingsautotrackBloc>()
                          .add(ChangeSwitchEvent(value: value));
                    });
              })
        ]));
  }

  /// Section Widget
  Widget _buildTabSubsection(BuildContext context) {
    return GestureDetector(
        onTap: () {
          requestStoragePermission(context);
        },
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 9.h),
            padding: EdgeInsets.symmetric(horizontal: 43.h, vertical: 2.v),
            decoration: AppDecoration.fillPrimary
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 6.v, bottom: 5.v),
                      child: Text("lbl_schedule".tr,
                          style: theme.textTheme.bodyMedium)),
                  CustomImageView(
                      imagePath: ImageConstant.imgSaveBlack900,
                      height: 33.adaptSize,
                      width: 33.adaptSize)
                ])));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Requests the user's permission to access the device's storage and retrieves
  /// a list of files, if permission is granted.
  ///
  /// Returns a [Future] that completes with a list of [String] objects representing
  /// the file paths. if permission is granted and files are available, otherwise an empty list.
  requestStoragePermission(BuildContext context) async {
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? fileList = [];
    FileManager().filePickerMethod(1000 * 1000, ['pdf', 'doc'],
        getFiles: (value) {
      fileList = value;
    });
  }
}
