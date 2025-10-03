import 'package:flutter/material.dart';
import '../theme/modern_theme.dart';
import '../core/utils/size_utils.dart';

/// Modern Input Field - Senior UI/UX Design
class ModernInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? error;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  
  const ModernInput({
    Key? key,
    this.controller,
    this.label,
    this.hint,
    this.error,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.keyboardType,
    this.maxLines = 1,
    this.onChanged,
    this.validator,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: ModernTypography.labelMedium.copyWith(
              color: ModernTheme.neutral700,
            ),
          ),
          SizedBox(height: ModernTheme.spaceXs),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLines: maxLines,
          onChanged: onChanged,
          validator: validator,
          style: ModernTypography.bodyMedium.copyWith(
            color: ModernTheme.neutralBlack,
          ),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefix,
            suffixIcon: suffix,
            filled: true,
            fillColor: ModernTheme.neutral100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ModernTheme.radiusMd),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ModernTheme.radiusMd),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ModernTheme.radiusMd),
              borderSide: BorderSide(
                color: ModernTheme.primaryBlue,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ModernTheme.radiusMd),
              borderSide: BorderSide(
                color: ModernTheme.error,
                width: 2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ModernTheme.radiusMd),
              borderSide: BorderSide(
                color: ModernTheme.error,
                width: 2,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: ModernTheme.spaceMd,
              vertical: ModernTheme.spaceMd,
            ),
          ),
        ),
        if (error != null) ...[
          SizedBox(height: ModernTheme.space2xs),
          Text(
            error!,
            style: ModernTypography.labelSmall.copyWith(
              color: ModernTheme.error,
            ),
          ),
        ],
      ],
    );
  }
}
