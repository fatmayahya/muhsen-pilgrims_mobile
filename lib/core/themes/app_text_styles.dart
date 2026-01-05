import 'package:flutter/material.dart';
import 'app_colors.dart';


class AppTextStyles {
  AppTextStyles._();

  // ═══════════════════════════════════════════════════════════
  // 🔹 Font Family
  // ═══════════════════════════════════════════════════════════
  
  static const String _fontFamily = 'Almarai';

  // ═══════════════════════════════════════════════════════════
  // 🔹 Headings
  // ═══════════════════════════════════════════════════════════

  /// Heading 1 – 28px
  static const TextStyle h1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w700,  
    color: AppColors.textPrimary,
  );

  /// Heading 2 – 24px 
  static const TextStyle h2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700, 
    color: AppColors.textPrimary,
  );

  /// Heading 3 – 20px
  static const TextStyle h3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // ═══════════════════════════════════════════════════════════
  // 🔹 Titles & Subtitles
  // ═══════════════════════════════════════════════════════════

  /// Title – 24px 
  static const TextStyle title = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  /// Subtitle – 16px 
  static const TextStyle subtitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  /// Subtitle Small – 14px 
  static const TextStyle subtitleSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary1,
  );

  // ═══════════════════════════════════════════════════════════
  // 🔹 Body Text
  // ═══════════════════════════════════════════════════════════

  /// Body Large – 18px
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  /// Body Regular – 16px
  static const TextStyle body = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  /// Body Small – 14px
  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  /// Body XSmall – 12px
  static const TextStyle bodyXSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  // ═══════════════════════════════════════════════════════════
  // 🔹 Labels
  // ═══════════════════════════════════════════════════════════

  /// Label – 14px Bold 
  static const TextStyle label = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,  
    color: AppColors.textPrimary,
  );

  /// Label Secondary – 14px 
  static const TextStyle labelSecondary = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  // ═══════════════════════════════════════════════════════════
  // 🔹 Buttons
  // ═══════════════════════════════════════════════════════════

  /// Button Large – 16px Bold
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,  
    color: AppColors.white,
  );

  /// Button Medium – 14px Bold
  static const TextStyle buttonMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  /// Button Small – 12px Bold
  static const TextStyle buttonSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  // ═══════════════════════════════════════════════════════════
  // 🔹 Input Fields
  // ═══════════════════════════════════════════════════════════

  /// Input Text – 16px
  static const TextStyle input = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  /// Hint/Placeholder – 16px 
  static const TextStyle hint = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textHint,
  );

  // ═══════════════════════════════════════════════════════════
  // 🔹 Special Styles
  // ═══════════════════════════════════════════════════════════

  /// Link Style
  static const TextStyle link = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    decoration: TextDecoration.underline,
  );

  /// Caption – 12px
  static const TextStyle caption = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
}