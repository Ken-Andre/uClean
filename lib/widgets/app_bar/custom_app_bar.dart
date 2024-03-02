import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 56.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 56.v,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgOutline:
        return Stack(
          children: [
            Container(
              height: 46.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: appTheme.blueGray100.withOpacity(0.35),
                    width: 1.h,
                  ),
                  bottom: BorderSide(
                    color: appTheme.blueGray100.withOpacity(0.35),
                    width: 1.h,
                  ),
                ),
              ),
            ),
            Container(
              height: 46.v,
              width: 392.h,
              margin: EdgeInsets.only(left: 1.h),
              decoration: BoxDecoration(
                color: appTheme.whiteA70001,
              ),
            ),
          ],
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgOutline,
}
