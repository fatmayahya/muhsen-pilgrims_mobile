import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';

// ═══════════════════════════════════════════════════════════
// 🔹 Button Sizes
// ═══════════════════════════════════════════════════════════

enum AppButtonSize {
  small(height: 40, textStyle: AppTextStyles.buttonSmall),
  medium(height: 48, textStyle: AppTextStyles.buttonMedium),
  large(height: 56, textStyle: AppTextStyles.buttonLarge);

  final double height;
  final TextStyle textStyle;

  const AppButtonSize({required this.height, required this.textStyle});
}

// ═══════════════════════════════════════════════════════════
// 🔹 Button Types
// ═══════════════════════════════════════════════════════════

enum AppButtonType {
  primary(
    backgroundColor: AppColors.primary,
    textColor: AppColors.white,
  ),
  secondary(
    backgroundColor: AppColors.secondary,
    textColor: AppColors.white,
  ),
  outlined(
    backgroundColor: Colors.transparent,
    textColor: AppColors.primary,
    hasBorder: true,
  ),
  text(
    backgroundColor: Colors.transparent,
    textColor: AppColors.primary,
  ),
  disabled(
    backgroundColor: AppColors.grey300,
    textColor: AppColors.grey400,
  );

  final Color backgroundColor;
  final Color textColor;
  final bool hasBorder;

  const AppButtonType({
    required this.backgroundColor,
    required this.textColor,
    this.hasBorder = false,
  });
}

// ═══════════════════════════════════════════════════════════
// 🔹 Main Button Widget
// ═══════════════════════════════════════════════════════════

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final AppButtonSize size;
  final AppButtonType type;
  final bool isLoading;
  final Widget? icon;
  final double? width;
  final double borderRadius;

  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.size = AppButtonSize.large,
    this.type = AppButtonType.primary,
    this.isLoading = false,
    this.icon,
    this.width,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || isLoading;

    return SizedBox(
      height: size.height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled 
              ? AppColors.grey300 
              : type.backgroundColor,
          foregroundColor: isDisabled 
              ? AppColors.grey400 
              : type.textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: type.hasBorder
                ? BorderSide(
                    color: isDisabled ? AppColors.grey300 : AppColors.primary,
                    width: 1.5,
                  )
                : BorderSide.none,
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: isLoading
            ? SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    type.textColor,
                  ),
                ),
              )
            : icon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon!,
                      const SizedBox(width: 8),
                      Text(title, style: size.textStyle),
                    ],
                  )
                : Text(title, style: size.textStyle),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// 🔹 Shortcut Widgets 
// ═══════════════════════════════════════════════════════════

/// (Primary Large)
class AppButtonLarge extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? icon;

  const AppButtonLarge({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: title,
      onPressed: onPressed,
      size: AppButtonSize.large,
      type: AppButtonType.primary,
      isLoading: isLoading,
      icon: icon,
    );
  }
}

/// (Primary Medium)
class AppButtonMedium extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;

  const AppButtonMedium({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: title,
      onPressed: onPressed,
      size: AppButtonSize.medium,
      type: AppButtonType.primary,
      isLoading: isLoading,
    );
  }
}

///(Primary Small)
class AppButtonSmall extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;

  const AppButtonSmall({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: title,
      onPressed: onPressed,
      size: AppButtonSize.small,
      type: AppButtonType.primary,
      isLoading: isLoading,
    );
  }
}

/// Outlined
class AppButtonOutlined extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final AppButtonSize size;

  const AppButtonOutlined({
    super.key,
    required this.title,
    required this.onPressed,
    this.size = AppButtonSize.large,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: title,
      onPressed: onPressed,
      size: size,
      type: AppButtonType.outlined,
    );
  }
}