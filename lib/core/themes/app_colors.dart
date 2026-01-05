import 'package:flutter/material.dart';

/// 🎨 مركز الألوان الموحد للتطبيق
class AppColors {
  AppColors._();

  // ═══════════════════════════════════════════════════════════
  // 🔹 Primary & Secondary Colors
  // ═══════════════════════════════════════════════════════════
  
  /// اللون الأساسي - الأخضر الداكن #14513A
  static const Color primary = Color(0xFF14513A);
  
  /// اللون الثانوي - الذهبي/البيج #9C8456
  static const Color secondary = Color(0xFF9C8456);
  
  /// اللون الثانوي 1 - الذهبي (نفس secondary للتوافق)
  static const Color secondary1 = Color(0xFF9C8456);
  
  /// اللون الثانوي 2 - الأسود الداكن #1E1E1E
  static const Color secondary2 = Color(0xFF1E1E1E);

  // ═══════════════════════════════════════════════════════════
  // 🔹 Basic Colors
  // ═══════════════════════════════════════════════════════════
  
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  // ═══════════════════════════════════════════════════════════
  // 🔹 Grey Scale
  // ═══════════════════════════════════════════════════════════
  

  static const Color grey100 = Color(0xFFF3F4F6);
  
  static const Color grey400 = Color(0xFF9CA3AF);
  
  
  static const Color grey600 = Color(0xFF4B5563);
  
 
  static const Color grey300 = Color(0xFFE5E7EB);
  
 
  static const Color lightGrey = Color(0xFFF9FAFB);

  // ═══════════════════════════════════════════════════════════
  // 🔹 Functional Colors
  // ═══════════════════════════════════════════════════════════
  
  
  static const Color border = Color(0xFFE5E7EB);
  

  static const Color splashBg = Color(0xFF14513A);
  
  
  static const Color splashCard = Color(0xFFFFFFFF);

  // ═══════════════════════════════════════════════════════════
  // 🔹 Text Colors
  // ═══════════════════════════════════════════════════════════
  

  static const Color textPrimary = Color(0xFF111827);
  

  static const Color textSecondary = Color(0xFF6B7280);
  
 
  static const Color textHint = Color(0xFFD1D5DB);

  // ═══════════════════════════════════════════════════════════
  // 🔹 Status Colors
  // ═══════════════════════════════════════════════════════════
  
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);
}