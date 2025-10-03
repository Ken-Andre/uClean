import 'package:flutter/material.dart';
import '../theme/modern_theme.dart';
import '../core/utils/size_utils.dart';

/// Modern AppBar Component - Senior UI/UX Design
class ModernAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final double? elevation;
  
  const ModernAppBar({
    Key? key,
    this.title,
    this.titleWidget,
    this.actions,
    this.leading,
    this.centerTitle = false,
    this.backgroundColor,
    this.showBackButton = true,
    this.onBackPressed,
    this.elevation,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? ModernTheme.neutralWhite,
      elevation: elevation ?? 0,
      centerTitle: centerTitle,
      leading: leading ?? (showBackButton && Navigator.canPop(context)
          ? IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ModernTheme.neutral100,
                  borderRadius: BorderRadius.circular(ModernTheme.radiusSm),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 16,
                  color: ModernTheme.neutralBlack,
                ),
              ),
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            )
          : null),
      title: titleWidget ??
          (title != null
              ? Text(
                  title!,
                  style: ModernTypography.headlineMedium,
                )
              : null),
      actions: actions,
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(56.v);
}
