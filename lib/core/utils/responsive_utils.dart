import 'package:flutter/material.dart';

class ResponsiveUtils {
  final BuildContext context;
  late final double screenWidth;
  late final double screenHeight;
  late final bool isSmallScreen;
  late final bool isMediumScreen;
  late final bool isLargeScreen;

  ResponsiveUtils(this.context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    isSmallScreen = screenWidth < 360;
    isMediumScreen = screenWidth >= 360 && screenWidth < 600;
    isLargeScreen = screenWidth >= 600;
  }

  // Content Width
  double get maxContentWidth {
    if (isLargeScreen) return 480.0;
    return screenWidth;
  }

  // Padding
  double get horizontalPadding {
    if (isSmallScreen) return 16.0;
    if (isMediumScreen) return 24.0;
    return 32.0;
  }

  double get verticalPadding {
    if (isSmallScreen) return 16.0;
    if (isMediumScreen) return 20.0;
    return 24.0;
  }

  // Spacing
  double get topPadding {
    if (screenHeight < 700) return 24.0;
    if (screenHeight < 800) return 40.0;
    return 48.0;
  }

  double get headerSpacing {
    if (screenHeight < 700) return 24.0;
    if (screenHeight < 800) return 32.0;
    return 40.0;
  }

  double get fieldSpacing {
    if (screenHeight < 700) return 16.0;
    if (screenHeight < 800) return 20.0;
    return 24.0;
  }

  double get buttonSpacing {
    if (screenHeight < 700) return 24.0;
    if (screenHeight < 800) return 28.0;
    return 32.0;
  }

  double get sectionSpacing {
    if (screenHeight < 700) return 16.0;
    return 20.0;
  }

  // Button Sizes
  double get buttonHeight {
    if (isSmallScreen) return 48.0;
    return 56.0;
  }

  double get buttonBorderRadius {
    return 12.0;
  }

  // Input Field Sizes
  double get inputHeight {
    if (isSmallScreen) return 48.0;
    return 56.0;
  }

  double get inputBorderRadius {
    return 12.0;
  }

  EdgeInsets get inputPadding {
    return const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    );
  }

  // Font Sizes
  double get titleFontSize {
    if (isSmallScreen) return 24.0;
    if (isMediumScreen) return 28.0;
    return 32.0;
  }

  double get subtitleFontSize {
    if (isSmallScreen) return 14.0;
    return 16.0;
  }

  double get bodyFontSize {
    if (isSmallScreen) return 14.0;
    return 16.0;
  }

  double get buttonFontSize {
    if (isSmallScreen) return 14.0;
    return 16.0;
  }

  // OTP Input
  double get otpBoxSize {
    if (isSmallScreen) return 45.0;
    if (isMediumScreen) return 50.0;
    return 55.0;
  }

  double get otpBoxHeight {
    if (isSmallScreen) return 55.0;
    return 60.0;
  }

  // Password Strength Indicator
  double get strengthIndicatorHeight {
    return 4.0;
  }

  // Logo Size (Splash)
  double get logoSize {
    if (isSmallScreen) return 150.0;
    if (isMediumScreen) return 180.0;
    return 200.0;
  }

  // Helper: Get responsive padding
  EdgeInsets get screenPadding {
    return EdgeInsets.symmetric(
      horizontal: horizontalPadding,
      vertical: verticalPadding,
    );
  }

  // Helper: Get safe area padding
  EdgeInsets get safeAreaPadding {
    final padding = MediaQuery.of(context).padding;
    return EdgeInsets.only(
      top: padding.top + verticalPadding,
      bottom: padding.bottom + verticalPadding,
      left: horizontalPadding,
      right: horizontalPadding,
    );
  }
}

// Extension for easy access
extension ResponsiveContext on BuildContext {
  ResponsiveUtils get responsive => ResponsiveUtils(this);
}