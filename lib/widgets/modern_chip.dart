import 'package:flutter/material.dart';
import '../theme/modern_theme.dart';

/// Modern Chip Component - Senior UI/UX Design
class ModernChip extends StatelessWidget {
  final String label;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onTap;
  final bool isSelected;
  final ModernChipSize size;
  
  const ModernChip({
    Key? key,
    required this.label,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.onTap,
    this.isSelected = false,
    this.size = ModernChipSize.medium,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(ModernTheme.radiusFull),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: _getHorizontalPadding(),
            vertical: _getVerticalPadding(),
          ),
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            borderRadius: BorderRadius.circular(ModernTheme.radiusFull),
            border: isSelected
                ? Border.all(color: ModernTheme.primaryBlue, width: 2)
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                icon!,
                SizedBox(width: ModernTheme.space2xs),
              ],
              Text(
                label,
                style: _getTextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  double _getHorizontalPadding() {
    switch (size) {
      case ModernChipSize.small:
        return ModernTheme.spaceSm;
      case ModernChipSize.medium:
        return ModernTheme.spaceMd;
      case ModernChipSize.large:
        return ModernTheme.spaceLg;
    }
  }
  
  double _getVerticalPadding() {
    switch (size) {
      case ModernChipSize.small:
        return ModernTheme.space2xs;
      case ModernChipSize.medium:
        return ModernTheme.spaceXs;
      case ModernChipSize.large:
        return ModernTheme.spaceSm;
    }
  }
  
  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;
    if (isSelected) return ModernTheme.primaryBlue.withValues(alpha: 0.1);
    return ModernTheme.neutral100;
  }
  
  TextStyle _getTextStyle() {
    final baseStyle = size == ModernChipSize.small
        ? ModernTypography.labelSmall
        : size == ModernChipSize.medium
            ? ModernTypography.labelMedium
            : ModernTypography.labelLarge;
    
    return baseStyle.copyWith(
      color: textColor ?? (isSelected ? ModernTheme.primaryBlue : ModernTheme.neutral700),
      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
    );
  }
}

enum ModernChipSize {
  small,
  medium,
  large,
}
