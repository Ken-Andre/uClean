import 'package:flutter/material.dart';
import 'package:ucleankim/core/app_export.dart';

/// A class that holds custom shadow and border styles for the application.
class AppDecoration {
  // ------------------- Private Reusable Components -------------------

  /// A soft shadow for cards and elevated elements.
  static final BoxShadow _softShadow = BoxShadow(
    color: appTheme.black900.withValues(alpha: 0.25),
    spreadRadius: 2.h,
    blurRadius: 2.h,
    offset: Offset(0, 1),
  );

  /// A medium shadow, slightly more pronounced.
  static final BoxShadow _mediumShadow = BoxShadow(
    color: appTheme.black900.withValues(alpha: 0.25),
    spreadRadius: 2.h,
    blurRadius: 2.h,
    offset: Offset(0, 2),
  );

  /// A custom shadow with a different offset.
  static final BoxShadow _angledShadow = BoxShadow(
    color: appTheme.black900.withValues(alpha: 0.25),
    spreadRadius: 2.h,
    blurRadius: 2.h,
    offset: Offset(1, 2),
  );

  // ------------------- Fill Decorations -------------------

  static final BoxDecoration fillCyan = BoxDecoration(
    color: appTheme.cyan200Cc,
  );

  static final BoxDecoration fillGray = BoxDecoration(
    color: appTheme.gray10001,
  );

  static final BoxDecoration fillGray50 = BoxDecoration(
    color: appTheme.gray5059,
  );

  static final BoxDecoration fillLightGreen = BoxDecoration(
    color: appTheme.lightGreen200,
  );

  static final BoxDecoration fillPrimary = BoxDecoration(
    color: theme.colorScheme.primary,
  );

  static final BoxDecoration fillWhite = BoxDecoration(
    color: appTheme.whiteA70001,
  );

  // ------------------- Outline & Shadow Decorations -------------------

  /// A card with a gray background and a medium shadow.
  static BoxDecoration get cardWithMediumShadow => BoxDecoration(
        color: appTheme.gray100,
        boxShadow: [_mediumShadow],
      );

  /// A card with a white background and an angled shadow.
  static BoxDecoration get cardWithAngledShadow => BoxDecoration(
        color: appTheme.whiteA70001,
        boxShadow: [_angledShadow],
      );

  /// A container with a semi-transparent blue-gray border.
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: appTheme.whiteA70001,
        border: Border.all(
          color: appTheme.blueGray100.withValues(alpha: 0.65),
          width: 1.h,
          strokeAlign: strokeAlignOutside,
        ),
      );

  /// A simple gray border on all sides.
  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border.all(
          color: appTheme.gray400,
          width: 1.h,
          strokeAlign: strokeAlignOutside,
        ),
      );

  /// A simple black border on all sides (previously outlineBlack9002/outlineBlack9003/outlineBlack9004).
  static BoxDecoration get outlineBlack => BoxDecoration(
        border: Border.all(
          color: appTheme.black900,
          width: 1.h,
          strokeAlign: strokeAlignOutside,
        ),
      );

  /// A light gray border for table cells (previously outlineGray4001).
  static BoxDecoration get outlineGrayLight => BoxDecoration(
        border: Border.all(
          color: appTheme.gray400,
          width: 1.h,
          strokeAlign: strokeAlignOutside,
        ),
      );

  /// A semi-transparent white border.
  static BoxDecoration get outlineWhite => BoxDecoration(
        border: Border.all(
          color: appTheme.whiteA70001.withValues(alpha: 0.5),
          width: 1.h,
          strokeAlign: strokeAlignOutside,
        ),
      );
}

/// A class that holds custom border radius values.
class BorderRadiusStyle {
  // --- Constant Border Radius Values ---
  // Use these when you don't need responsive sizing for better performance.
  static const BorderRadius roundedBorder5 =
      BorderRadius.all(Radius.circular(5));
  static const BorderRadius roundedBorder9 =
      BorderRadius.all(Radius.circular(9));
  static const BorderRadius circleBorder20 =
      BorderRadius.all(Radius.circular(20));
  static const BorderRadius roundedBorder23 =
      BorderRadius.all(Radius.circular(23));
  static const BorderRadius customBorderTop12 =
      BorderRadius.vertical(top: Radius.circular(12));

  // --- Responsive Border Radius Getters ---
  // Use these when the radius needs to scale with the screen size.
  static BorderRadius get roundedBorder5Responsive =>
      BorderRadius.circular(5.h);
  static BorderRadius get roundedBorder9Responsive =>
      BorderRadius.circular(9.h);
  static BorderRadius get circleBorder20Responsive =>
      BorderRadius.circular(20.h);
  static BorderRadius get roundedBorder23Responsive =>
      BorderRadius.circular(23.h);
  static BorderRadius get customBorderTop12Responsive =>
      BorderRadius.vertical(top: Radius.circular(12.h));
}

// StrokeAlign is a helper to access BorderSide stroke alignment constants.
// This is fine as is, but ensure your project's minimum Flutter version is 3.7.2 or greater.
double get strokeAlignInside => BorderSide.strokeAlignInside;
double get strokeAlignCenter => BorderSide.strokeAlignCenter;
double get strokeAlignOutside => BorderSide.strokeAlignOutside;
