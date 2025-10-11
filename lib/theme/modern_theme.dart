import 'package:flutter/material.dart';
import '../core/utils/size_utils.dart';

/// Modern Design System for uClean
/// Senior-level UI/UX implementation with cohesive theme
class ModernTheme {
  // ==================== COLOR PALETTE ====================
  // Based on splash screen gradient colors

  // Primary Brand Colors (from gradients)
  static const Color primaryBlue = Color(0xFF1D858A); // Cyan-blue from splash
  static const Color primaryPink = Color(0xFFFF7968); // Coral-pink from splash
  static const Color primaryYellow =
      Color(0xFFFBE468); // Warm yellow from splash

  // Gradient Colors (extracted from splash assets)
  static const Color gradientBlueStart = Color(0xFF003366);
  static const Color gradientBlueEnd = Color(0xFF63ACD4);
  static const Color gradientPinkStart = Color(0xFFCD7A91);
  static const Color gradientPinkEnd = Color(0xFFFF7968);
  static const Color gradientYellowStart = Color(0xFFFFBE7E);
  static const Color gradientYellowEnd = Color(0xFFFBE468);

  // Neutral Colors
  static const Color neutralBlack = Color(0xFF1C1B1F);
  static const Color neutral900 = Color(0xFF2D2D2D);
  static const Color neutral700 = Color(0xFF5F5F5F);
  static const Color neutral500 = Color(0xFF9E9E9E);
  static const Color neutral300 = Color(0xFFD1D1D1);
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutralWhite = Color(0xFFFFFFFF);

  // Semantic Colors
  static const Color success = Color(0xFF38FF93);
  static const Color warning = Color(0xFFFF860B);
  static const Color error = Color(0xFFFF7968);
  static const Color info = Color(0xFF63ACD4);

  // ==================== GRADIENTS ====================

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientBlueStart, gradientBlueEnd],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientPinkStart, gradientPinkEnd],
  );

  static const LinearGradient warmGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientYellowStart, gradientYellowEnd],
  );

  // Splash screen multi-gradient overlay effect
  static Widget splashGradientOverlay({required Widget child}) {
    return Stack(
      children: [
        // Pink gradient (top-left)
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 253,
            height: 271,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  gradientPinkStart.withValues(alpha: 0.6),
                  gradientPinkEnd.withValues(alpha: 0.3),
                ],
              ),
            ),
          ),
        ),
        // Blue gradient (right)
        Positioned(
          top: 50,
          right: 0,
          child: Container(
            width: 253,
            height: 271,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  gradientBlueStart.withValues(alpha: 0.6),
                  gradientBlueEnd.withValues(alpha: 0.3),
                ],
              ),
            ),
          ),
        ),
        // Yellow gradient (bottom-left)
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: 253,
            height: 271,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  gradientYellowStart.withValues(alpha: 0.3),
                  gradientYellowEnd.withValues(alpha: 0.2),
                ],
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }

  // ==================== SPACING SYSTEM ====================

  static const double space2xs = 4.0;
  static const double spaceXs = 8.0;
  static const double spaceSm = 12.0;
  static const double spaceMd = 16.0;
  static const double spaceLg = 24.0;
  static const double spaceXl = 32.0;
  static const double space2xl = 48.0;
  static const double space3xl = 64.0;

  // ==================== BORDER RADIUS ====================

  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusFull = 999.0;

  // ==================== SHADOWS ====================

  static List<BoxShadow> get shadowSm => [
        BoxShadow(
          color: neutralBlack.withValues(alpha: 0.08),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get shadowMd => [
        BoxShadow(
          color: neutralBlack.withValues(alpha: 0.12),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get shadowLg => [
        BoxShadow(
          color: neutralBlack.withValues(alpha: 0.16),
          blurRadius: 16,
          offset: const Offset(0, 8),
        ),
      ];

  static List<BoxShadow> get shadowXl => [
        BoxShadow(
          color: neutralBlack.withValues(alpha: 0.20),
          blurRadius: 24,
          offset: const Offset(0, 12),
        ),
      ];

  // ==================== THEME DATA ====================

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: primaryBlue,
        secondary: primaryPink,
        tertiary: primaryYellow,
        surface: neutralWhite,
        surfaceContainerHighest: neutral100,
        onPrimary: neutralWhite,
        onSecondary: neutralWhite,
        onSurface: neutralBlack,
        error: error,
      ),
      scaffoldBackgroundColor: neutralWhite,
      fontFamily: 'Poppins',

      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: neutralWhite,
        foregroundColor: neutralBlack,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: neutralBlack,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: neutralWhite,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMd),
        ),
        shadowColor: neutralBlack.withValues(alpha: 0.08),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: neutralWhite,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMd),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryBlue,
          textStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: neutral100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: const BorderSide(color: primaryBlue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: const BorderSide(color: error, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: neutral500,
        ),
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: neutral300,
        thickness: 1,
        space: 1,
      ),
    );
  }
}

/// Typography System
class ModernTypography {
  // Display Styles
  static TextStyle get displayLarge => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 32.fSize,
        fontWeight: FontWeight.w700,
        color: ModernTheme.neutralBlack,
        height: 1.2,
      );

  static TextStyle get displayMedium => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 28.fSize,
        fontWeight: FontWeight.w700,
        color: ModernTheme.neutralBlack,
        height: 1.2,
      );

  static TextStyle get displaySmall => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24.fSize,
        fontWeight: FontWeight.w600,
        color: ModernTheme.neutralBlack,
        height: 1.3,
      );

  // Headline Styles
  static TextStyle get headlineLarge => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 22.fSize,
        fontWeight: FontWeight.w600,
        color: ModernTheme.neutralBlack,
        height: 1.3,
      );

  static TextStyle get headlineMedium => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20.fSize,
        fontWeight: FontWeight.w600,
        color: ModernTheme.neutralBlack,
        height: 1.4,
      );

  static TextStyle get headlineSmall => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
        color: ModernTheme.neutralBlack,
        height: 1.4,
      );

  // Title Styles
  static TextStyle get titleLarge => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
        color: ModernTheme.neutralBlack,
        height: 1.5,
      );

  static TextStyle get titleMedium => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
        color: ModernTheme.neutralBlack,
        height: 1.5,
      );

  static TextStyle get titleSmall => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
        color: ModernTheme.neutralBlack,
        height: 1.5,
      );

  // Body Styles
  static TextStyle get bodyLarge => TextStyle(
        fontFamily: 'Inter',
        fontSize: 16.fSize,
        fontWeight: FontWeight.w400,
        color: ModernTheme.neutral700,
        height: 1.6,
      );

  static TextStyle get bodyMedium => TextStyle(
        fontFamily: 'Inter',
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
        color: ModernTheme.neutral700,
        height: 1.6,
      );

  static TextStyle get bodySmall => TextStyle(
        fontFamily: 'Inter',
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
        color: ModernTheme.neutral500,
        height: 1.6,
      );

  // Label Styles
  static TextStyle get labelLarge => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
        color: ModernTheme.neutral700,
        height: 1.4,
      );

  static TextStyle get labelMedium => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
        color: ModernTheme.neutral700,
        height: 1.4,
      );

  static TextStyle get labelSmall => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 10.fSize,
        fontWeight: FontWeight.w500,
        color: ModernTheme.neutral500,
        height: 1.4,
      );
}
