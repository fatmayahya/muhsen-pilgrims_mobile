import 'package:flutter/material.dart';


class AppSpacing {
  AppSpacing._();

  // ═══════════════════════════════════════════════════════════
  // 🔹 Spacing Values 
  // ═══════════════════════════════════════════════════════════
  
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;   
  static const double lg = 20.0;   
  static const double xl = 24.0;
  static const double xxl = 32.0;
  static const double xxxl = 48.0;

  // ═══════════════════════════════════════════════════════════
  // 🔹 Padding Presets
  // ═══════════════════════════════════════════════════════════
  
  static const EdgeInsets paddingXS = EdgeInsets.all(xs);
  static const EdgeInsets paddingSM = EdgeInsets.all(sm);
  static const EdgeInsets paddingMD = EdgeInsets.all(md);
  static const EdgeInsets paddingLG = EdgeInsets.all(lg);
  static const EdgeInsets paddingXL = EdgeInsets.all(xl);
  static const EdgeInsets paddingXXL = EdgeInsets.all(xxl);

  // Horizontal Padding
  static const EdgeInsets paddingH_SM = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets paddingH_MD = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets paddingH_LG = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets paddingH_XL = EdgeInsets.symmetric(horizontal: xl);
  static const EdgeInsets paddingH_XXL = EdgeInsets.symmetric(horizontal: xxl);

  // Vertical Padding
  static const EdgeInsets paddingV_SM = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets paddingV_MD = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets paddingV_LG = EdgeInsets.symmetric(vertical: lg);
  static const EdgeInsets paddingV_XL = EdgeInsets.symmetric(vertical: xl);
  static const EdgeInsets paddingV_XXL = EdgeInsets.symmetric(vertical: xxl);

  // Screen Padding (حواف الشاشة)
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: xl);

  // ═══════════════════════════════════════════════════════════
  // 🔹 SizedBox Helpers
  // ═══════════════════════════════════════════════════════════
  
  static const SizedBox verticalXS = SizedBox(height: xs);
  static const SizedBox verticalSM = SizedBox(height: sm);
  static const SizedBox verticalMD = SizedBox(height: md);
  static const SizedBox verticalLG = SizedBox(height: lg);
  static const SizedBox verticalXL = SizedBox(height: xl);
  static const SizedBox verticalXXL = SizedBox(height: xxl);

  static const SizedBox horizontalXS = SizedBox(width: xs);
  static const SizedBox horizontalSM = SizedBox(width: sm);
  static const SizedBox horizontalMD = SizedBox(width: md);
  static const SizedBox horizontalLG = SizedBox(width: lg);
  static const SizedBox horizontalXL = SizedBox(width: xl);
  static const SizedBox horizontalXXL = SizedBox(width: xxl);

  // ═══════════════════════════════════════════════════════════
  // 🔹 Border Radius 
  // ═══════════════════════════════════════════════════════════
  
  static const double radiusSM = 8.0;
  static const double radiusMD = 12.0;
  static const double radiusLG = 16.0;
  static const double radiusXL = 24.0;   
  static const double radiusFull = 999.0;

  static BorderRadius borderRadiusSM = BorderRadius.circular(radiusSM);
  static BorderRadius borderRadiusMD = BorderRadius.circular(radiusMD);
  static BorderRadius borderRadiusLG = BorderRadius.circular(radiusLG);
  static BorderRadius borderRadiusXL = BorderRadius.circular(radiusXL);
  static BorderRadius borderRadiusFull = BorderRadius.circular(radiusFull);
}

/// 📏 Extension 
extension SpacingExtension on num {
  SizedBox get verticalSpace => SizedBox(height: toDouble());
  SizedBox get horizontalSpace => SizedBox(width: toDouble());
  
  EdgeInsets get paddingAll => EdgeInsets.all(toDouble());
  EdgeInsets get paddingH => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get paddingV => EdgeInsets.symmetric(vertical: toDouble());
}