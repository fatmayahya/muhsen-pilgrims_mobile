class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'Muhsen Pilgrims';
  static const String appVersion = '1.0.0';
  static const String appPackage = 'com.muhsen.pilgrims';

  // Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  static const String languageKey = 'language';
  static const String themeKey = 'theme_mode';
  static const String onboardingKey = 'onboarding_completed';

  // Timeouts & Limits
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration splashDuration = Duration(seconds: 2);
  static const Duration otpResendDelay = Duration(seconds: 60);

  static const int maxFileSize = 5 * 1024 * 1024; // 5MB
  static const int otpLength = 4;
  static const int passwordMinLength = 8;

  // Validation Regex
  static final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final RegExp saudiPhoneRegex = RegExp(
    r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$',
  );

  static final RegExp numbersOnlyRegex = RegExp(r'^[0-9]+$');
  static final RegExp lettersOnlyRegex = RegExp(r'^[a-zA-Zأ-ي\s]+$');

  // Supported Locales
  static const String defaultLocale = 'ar';
  static const List<String> supportedLocales = ['ar', 'en'];

  // Image Paths
  static const String logoPath = 'assets/images/logo.jpeg';
  static const String splashLogoPath = 'assets/images/logo.jpeg';

  // Contact & Social
  static const String supportEmail = 'support@muhsenpilgrims.com';
  static const String supportPhone = '+966500000000';
  static const String websiteUrl = 'https://muhsenpilgrims.com';

  static const String twitterUrl = 'https://twitter.com/muhsenpilgrims';
  static const String instagramUrl = 'https://instagram.com/muhsenpilgrims';
  static const String facebookUrl = 'https://facebook.com/muhsenpilgrims';

  // Error Messages (Arabic)
  static const String networkError = 'تحقق من اتصالك بالإنترنت';
  static const String serverError = 'حدث خطأ في الخادم، حاول مرة أخرى';
  static const String unknownError = 'حدث خطأ غير متوقع';
  static const String sessionExpired = 'انتهت صلاحية الجلسة، سجل دخولك مرة أخرى';
}