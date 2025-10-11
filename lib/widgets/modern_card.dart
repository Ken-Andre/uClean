import 'package:flutter/material.dart';
import '../theme/modern_theme.dart';

/// Modern Card Component - Senior UI/UX Design
class ModernCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final ModernCardVariant variant;
  final bool hasShadow;

  const ModernCard({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.variant = ModernCardVariant.elevated,
    this.hasShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(ModernTheme.radiusMd),
          child: Ink(
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(ModernTheme.radiusMd),
              border: _getBorder(),
              boxShadow: hasShadow && variant == ModernCardVariant.elevated
                  ? ModernTheme.shadowMd
                  : null,
            ),
            child: Padding(
              padding: padding ?? const EdgeInsets.all(ModernTheme.spaceMd),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case ModernCardVariant.elevated:
        return ModernTheme.neutralWhite;
      case ModernCardVariant.filled:
        return ModernTheme.neutral100;
      case ModernCardVariant.outlined:
        return ModernTheme.neutralWhite;
    }
  }

  Border? _getBorder() {
    if (variant == ModernCardVariant.outlined) {
      return Border.all(
        color: ModernTheme.neutral300,
        width: 1,
      );
    }
    return null;
  }
}

enum ModernCardVariant {
  elevated,
  filled,
  outlined,
}
