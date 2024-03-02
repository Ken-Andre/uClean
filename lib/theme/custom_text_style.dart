import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18.fSize,
      );
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.64),
        fontSize: 18.fSize,
      );
  static get bodyLargeBlack900_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.56),
      );
  static get bodyLargeBlack900_2 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.45),
      );
  static get bodyLargeBlue300 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blue300,
      );
  static get bodyLargeCyan800 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.cyan800,
      );
  static get bodyLargeDeeporange300 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.deepOrange300,
      );
  static get bodyLargeGray10001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray10001,
        fontSize: 18.fSize,
      );
  static get bodyLargeGray10002 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray10002,
        fontSize: 18.fSize,
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
  static get bodyLargeInterErrorContainer =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get bodyLargeInterGray900a2 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.gray900A2,
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
  static get bodyLargePoppinsBlack900 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.black900.withOpacity(0.64),
        fontSize: 18.fSize,
      );
  static get bodyLargePoppinsBlack90018 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.black900,
        fontSize: 18.fSize,
      );
  static get bodyLargePoppinsBlack900_1 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.black900.withOpacity(0.56),
      );
  static get bodyLargePoppinsBlack900_2 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.black900.withOpacity(0.45),
      );
  static get bodyLargePoppinsBlack900_3 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargePoppinsBlue300 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.blue300,
      );
  static get bodyLargePoppinsCyan800 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.cyan800,
      );
  static get bodyLargePoppinsDeeporange300 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.deepOrange300,
      );
  static get bodyLargePoppinsGray10002 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.gray10002,
        fontSize: 18.fSize,
      );
  static get bodyLargePoppinsOrange700 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.orange700,
      );
  static get bodyLargePoppinsPrimary =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
      );
  static get bodyLargePoppinsPrimary_1 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyLargePoppinsff000000 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: Color(0XFF000000),
        fontSize: 18.fSize,
      );
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.8),
      );
  static get bodyLargePrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get bodyLargePrimaryContainer_1 => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get bodyLargePrimary_1 => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyLargeRobotoPrimaryContainer =>
      theme.textTheme.bodyLarge!.roboto.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get bodyLargeRobotoPrimaryContainer_1 =>
      theme.textTheme.bodyLarge!.roboto.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get bodyLargeRobotoff606060 =>
      theme.textTheme.bodyLarge!.roboto.copyWith(
        color: Color(0XFF606060),
      );
  static get bodyLargeWhiteA70001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA70001,
      );
  static get bodyLargeWhiteA70001_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA70001.withOpacity(0.8),
      );
  static get bodyLargeff000000 => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFF000000),
        fontSize: 18.fSize,
      );
  static get bodyMedium15 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
      );
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
  static get bodyMediumBlack90015 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 15.fSize,
      );
  static get bodyMediumBlack900Light => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.65),
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumBlack900Light_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.45),
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumBlack900Light_2 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumBlack900_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.45),
      );
  static get bodyMediumBlack900_2 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
  static get bodyMediumInter => theme.textTheme.bodyMedium!.inter.copyWith(
        fontSize: 13.fSize,
      );
  static get bodyMediumInterBlack900 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.black900,
        fontSize: 13.fSize,
      );
  static get bodyMediumLight => theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumRobotoPrimaryContainer =>
      theme.textTheme.bodyMedium!.roboto.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get bodyMediumWhiteA70001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA70001,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumff000000 => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF000000),
      );
  static get bodySmall11 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 11.fSize,
      );
  static get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallGray50001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray50001,
      );
  static get bodySmallInterGray500 => theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.gray500,
      );
  // Headline text style
  static get headlineSmallPoppins =>
      theme.textTheme.headlineSmall!.poppins.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get headlineSmallPoppinsBold =>
      theme.textTheme.headlineSmall!.poppins.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallPoppins_1 => theme.textTheme.headlineSmall!.poppins;
  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.84),
        fontWeight: FontWeight.w600,
      );
  static get titleLargeBlack900Regular => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.45),
        fontWeight: FontWeight.w400,
      );
  static get titleLargeBlack900SemiBold => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.85),
        fontWeight: FontWeight.w600,
      );
  static get titleLargeBlack900_1 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.45),
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
  static get titleLargeRegular => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get titleLargeRegular_1 => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get titleLargeSemiBold => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMediumInter => theme.textTheme.titleMedium!.inter.copyWith(
        fontSize: 19.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumInter_1 => theme.textTheme.titleMedium!.inter;
  static get titleMediumRoboto => theme.textTheme.titleMedium!.roboto.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMediumRobotoff000000 =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        color: Color(0XFF000000),
      );
  static get titleMediumRobotoff606060 =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        color: Color(0XFF606060),
      );
  static get titleSmallBold => theme.textTheme.titleSmall!.copyWith(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallff000000 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF000000),
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
