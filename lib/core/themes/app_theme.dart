import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';


ThemeData appTheme() {
  return ThemeData(
    // ═══════════════════════════════════════════════════════════
    // 🔹 Colors
    // ═══════════════════════════════════════════════════════════
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.white,
      error: AppColors.error,
    ),

    // ═══════════════════════════════════════════════════════════
    // 🔹 Typography
    // ═══════════════════════════════════════════════════════════
    fontFamily: 'Almarai',
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.h1,
      displayMedium: AppTextStyles.h2,
      displaySmall: AppTextStyles.h3,
      headlineLarge: AppTextStyles.title,
      headlineMedium: AppTextStyles.subtitle,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.body,
      bodySmall: AppTextStyles.bodySmall,
      labelLarge: AppTextStyles.label,
      labelMedium: AppTextStyles.caption,
    ),

    // ═══════════════════════════════════════════════════════════
    // 🔹 AppBar Theme
    // ═══════════════════════════════════════════════════════════
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.h3,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),

    // ═══════════════════════════════════════════════════════════
    // 🔹 Input Decoration Theme
    // ═══════════════════════════════════════════════════════════
    inputDecorationTheme: InputDecorationTheme(
      filled: false,
      labelStyle: AppTextStyles.labelSecondary,
      hintStyle: AppTextStyles.hint,
      
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      // Border - Default
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.border,
          width: 1,
        ),
      ),

      // Border - Enabled
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.border,
          width: 1,
        ),
      ),

      // Border - Focused
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 1.5,
        ),
      ),

      // Border - Error
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.error,
          width: 1,
        ),
      ),

      // Border - Focused Error
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.error,
          width: 1.5,
        ),
      ),
    ),

    // ═══════════════════════════════════════════════════════════
    // 🔹 Elevated Button Theme
    // ═══════════════════════════════════════════════════════════
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        textStyle: AppTextStyles.buttonLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    ),

    // ═══════════════════════════════════════════════════════════
    // 🔹 Text Button Theme
    // ═══════════════════════════════════════════════════════════
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppTextStyles.link,
      ),
    ),

    // ═══════════════════════════════════════════════════════════
    // 🔹 Card Theme 
    // ═══════════════════════════════════════════════════════════
    cardTheme: CardThemeData(  
      color: AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: AppColors.border,
          width: 1,
        ),
      ),
    ),

    // ═══════════════════════════════════════════════════════════
    // 🔹 Divider Theme
    // ═══════════════════════════════════════════════════════════
    dividerTheme: const DividerThemeData(
      color: AppColors.grey300,
      thickness: 1,
      space: 24,
    ),

    // ═══════════════════════════════════════════════════════════
    // 🔹 Icon Theme
    // ═══════════════════════════════════════════════════════════
    iconTheme: const IconThemeData(
      color: AppColors.textPrimary,
      size: 24,
    ),
  );
}