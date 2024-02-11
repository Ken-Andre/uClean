import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.56),
      );
  static get bodyLargeBlue300 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blue300,
      );
  static get bodyLargeBluegray100 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray100,
      );
  static get bodyLargeCyan800 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.cyan800,
      );
  static get bodyLargeDeeporange300 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.deepOrange300,
      );
  static get bodyLargeInterBlack900 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.black900.withOpacity(0.6),
        fontSize: 18.fSize,
      );
  static get bodyLargeInterBlack90018 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.black900.withOpacity(0.64),
        fontSize: 18.fSize,
      );
  static get bodyLargeInterOnErrorContainer =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 18.fSize,
      );
  static get bodyLargeInterOrange600 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.orange600,
      );
  static get bodyLargeOrange700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.orange700,
      );
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyLarge_1 => theme.textTheme.bodyLarge!;
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.45),
      );
  static get bodyMediumInter => theme.textTheme.bodyMedium!.inter.copyWith(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyMediumRegular => theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get bodyMediumRegular15 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w400,
      );
  static get bodySmall11 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 11.fSize,
      );
  static get bodySmall8 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 8.fSize,
      );
  static get bodySmallGray500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500,
      );
  static get bodySmallInter => theme.textTheme.bodySmall!.inter.copyWith(
        fontSize: 10.fSize,
      );
  static get bodySmallInter_1 => theme.textTheme.bodySmall!.inter;
  // Headline style
  static get headlineSmallPoppins => theme.textTheme.headlineSmall!.poppins;
  static get headlineSmallPoppinsBold =>
      theme.textTheme.headlineSmall!.poppins.copyWith(
        fontWeight: FontWeight.w700,
      );
  // Label text style
  static get labelLargePoppins => theme.textTheme.labelLarge!.poppins.copyWith(
        fontSize: 12.fSize,
      );
  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.84),
        fontWeight: FontWeight.w600,
      );
  static get titleLargeBlack900SemiBold => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.85),
        fontWeight: FontWeight.w600,
      );
  static get titleLargeInter => theme.textTheme.titleLarge!.inter.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleLargeInterBlack900 =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: appTheme.black900.withOpacity(0.67),
        fontSize: 22.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumSemiBold => theme.textTheme.titleMedium!.copyWith(
        fontSize: 19.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBold => theme.textTheme.titleSmall!.copyWith(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
}

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
