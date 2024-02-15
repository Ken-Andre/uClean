import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillCyan => ElevatedButton.styleFrom(
        backgroundColor: appTheme.cyan600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
      );
  static ButtonStyle get fillCyanTL101 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.cyan900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
      );
  static ButtonStyle get fillCyanTL5 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.cyan900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.h),
        ),
      );
  static ButtonStyle get fillGrayTL10 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
      );
  static ButtonStyle get fillLightBlue => ElevatedButton.styleFrom(
        backgroundColor: appTheme.lightBlue400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
      );
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.h),
        ),
      );
  static ButtonStyle get fillYellow => ElevatedButton.styleFrom(
        backgroundColor: appTheme.yellow10097,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
      );

  // Outline button style
  static ButtonStyle get outlineBlack => ElevatedButton.styleFrom(
        backgroundColor: appTheme.cyan900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.h),
        ),
        shadowColor: appTheme.black900.withOpacity(0.25),
        elevation: 2,
      );
  static ButtonStyle get outlineBlack900 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.h),
        ),
        shadowColor: appTheme.black900.withOpacity(0.25),
        elevation: 1,
      );
  static ButtonStyle get outlineBlack1 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onError,
        shadowColor: appTheme.black900.withOpacity(0.25),
        elevation: 3,
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
