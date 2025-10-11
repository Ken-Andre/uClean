import 'package:flutter/material.dart';
import '../theme/modern_theme.dart';
import '../core/utils/size_utils.dart';

/// Modern Button Component - Senior UI/UX Design
class ModernButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ModernButtonVariant variant;
  final ModernButtonSize size;
  final Widget? icon;
  final bool isLoading;
  final bool isFullWidth;

  const ModernButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.variant = ModernButtonVariant.primary,
    this.size = ModernButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFullWidth ? double.infinity : null,
      height: _getHeight(),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(ModernTheme.radiusMd),
          child: Ink(
            decoration: BoxDecoration(
              gradient: _getGradient(),
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(ModernTheme.radiusMd),
              border: _getBorder(),
              boxShadow: variant == ModernButtonVariant.primary
                  ? ModernTheme.shadowSm
                  : null,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _getHorizontalPadding(),
                  vertical: _getVerticalPadding(),
                ),
                child: isLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _getTextColor(),
                          ),
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (icon != null) ...[
                            icon!,
                            SizedBox(width: ModernTheme.spaceXs),
                          ],
                          Text(
                            text,
                            style: _getTextStyle(),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _getHeight() {
    switch (size) {
      case ModernButtonSize.small:
        return 36.v;
      case ModernButtonSize.medium:
        return 48.v;
      case ModernButtonSize.large:
        return 56.v;
    }
  }

  double _getHorizontalPadding() {
    switch (size) {
      case ModernButtonSize.small:
        return ModernTheme.spaceMd;
      case ModernButtonSize.medium:
        return ModernTheme.spaceLg;
      case ModernButtonSize.large:
        return ModernTheme.spaceXl;
    }
  }

  double _getVerticalPadding() {
    switch (size) {
      case ModernButtonSize.small:
        return ModernTheme.spaceXs;
      case ModernButtonSize.medium:
        return ModernTheme.spaceSm;
      case ModernButtonSize.large:
        return ModernTheme.spaceMd;
    }
  }

  Gradient? _getGradient() {
    if (variant == ModernButtonVariant.gradient) {
      return ModernTheme.primaryGradient;
    }
    return null;
  }

  Color? _getBackgroundColor() {
    switch (variant) {
      case ModernButtonVariant.primary:
        return ModernTheme.primaryBlue;
      case ModernButtonVariant.secondary:
        return ModernTheme.primaryPink;
      case ModernButtonVariant.outline:
        return Colors.transparent;
      case ModernButtonVariant.ghost:
        return Colors.transparent;
      case ModernButtonVariant.gradient:
        return null;
    }
  }

  Border? _getBorder() {
    if (variant == ModernButtonVariant.outline) {
      return Border.all(
        color: ModernTheme.primaryBlue,
        width: 2,
      );
    }
    return null;
  }

  Color _getTextColor() {
    switch (variant) {
      case ModernButtonVariant.primary:
      case ModernButtonVariant.secondary:
      case ModernButtonVariant.gradient:
        return ModernTheme.neutralWhite;
      case ModernButtonVariant.outline:
      case ModernButtonVariant.ghost:
        return ModernTheme.primaryBlue;
    }
  }

  TextStyle _getTextStyle() {
    final baseStyle = size == ModernButtonSize.small
        ? ModernTypography.labelMedium
        : size == ModernButtonSize.medium
            ? ModernTypography.labelLarge
            : ModernTypography.titleMedium;

    return baseStyle.copyWith(
      color: _getTextColor(),
      fontWeight: FontWeight.w600,
    );
  }
}

enum ModernButtonVariant {
  primary,
  secondary,
  outline,
  ghost,
  gradient,
}

enum ModernButtonSize {
  small,
  medium,
  large,
}
