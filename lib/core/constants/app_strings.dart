class AppStrings {
  AppStrings._();

  // App Info
  static const String appName = 'محسن للحجاج';

  // Register Page
  static const String registerTitle = 'تسجيل حساب جديد';
  static const String registerSubtitle = 'مرحباً بك معنا';
  static const String passportLabel = 'رقم الجواز';
  static const String passportHint = 'أدخل رقم الجواز';
  static const String phoneLabel = 'رقم الجوال';
  static const String phoneHint = '5XXXXXXXX';
  static const String createAccountButton = 'إنشاء حساب';
  static const String haveAccountQuestion = 'لديك حساب؟ ';
  static const String loginLink = 'تسجيل الدخول';

  // OTP Page
  static const String otpTitle = 'تأكيد رمز التحقق';
  static const String otpSubtitle = 'تم إرسال رمز التحقق إلى رقم الجوال';
  static const String otpContinueButton = 'المتابعة';
  static const String otpResendTimer = 'إعادة الإرسال بعد {seconds} ثانية';
  static const String otpResendButton = 'إعادة إرسال الرمز';

  // Password Page
  static const String passwordTitle = 'إنشاء كلمة المرور';
  static const String passwordSubtitle = 'أدخل كلمة مرور قوية لحماية حسابك';
  static const String passwordLabel = 'كلمة المرور';
  static const String passwordHint = '••••••••';
  static const String confirmPasswordLabel = 'تأكيد كلمة المرور';
  static const String otpCodeLabel = 'رمز التحقق: ';
  static const String changeOtpButton = 'تغيير';
  static const String passwordRequirementsTitle = 'متطلبات كلمة المرور:';
  static const String passwordReq1 = '8 أحرف على الأقل';
  static const String passwordReq2 = 'حرف كبير واحد (A-Z)';
  static const String passwordReq3 = 'حرف صغير واحد (a-z)';
  static const String passwordReq4 = 'رقم واحد (0-9)';
  static const String createAccountFinalButton = 'إنشاء الحساب';

  // Home/Success Page
  static const String homeTitle = 'الرئيسية';
  static const String successTitle = 'تم إنشاء الحساب بنجاح!';
  static const String successSubtitle = 'مرحباً بك في تطبيق محسن للحجاج';
  static const String exploreAppButton = 'استكشاف التطبيق';

  // Validation Messages
  static const String requiredField = 'هذا الحقل مطلوب';
  static const String passportRequired = 'رقم الجواز مطلوب';
  static const String passportMinLength = 'رقم الجواز يجب أن يكون 6 أحرف على الأقل';
  static const String phoneRequired = 'رقم الجوال مطلوب';
  static const String phoneInvalid = 'رقم الجوال غير صحيح';
  static const String otpRequired = 'رمز التحقق مطلوب';
  static const String otpIncomplete = 'الرجاء إدخال رمز التحقق كاملاً';
  static const String passwordRequired = 'كلمة المرور مطلوبة';
  static const String passwordMinLength = 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
  static const String passwordMismatch = 'كلمات المرور غير متطابقة';
  static const String passwordWeak = 'كلمة المرور ضعيفة';

  // Password Strength
  static const String strengthVeryWeak = 'ضعيفة جداً';
  static const String strengthWeak = 'ضعيفة';
  static const String strengthMedium = 'متوسطة';
  static const String strengthStrong = 'قوية';

  // Error Messages - API
  static const String errorNetwork = 'تحقق من اتصالك بالإنترنت';
  static const String errorServer = 'حدث خطأ في الخادم، حاول مرة أخرى';
  static const String errorTimeout = 'انتهت مهلة الاتصال';
  static const String errorUnknown = 'حدث خطأ غير متوقع';
  
  // Specific Errors
  static const String errorDuplicatePassport = 'رقم الجواز مسجل مسبقاً';
  static const String errorDuplicatePhone = 'رقم الجوال مسجل مسبقاً';
  static const String errorInvalidPassport = 'رقم الجواز غير صحيح';
  static const String errorInvalidOtp = 'رمز التحقق غير صحيح';
  static const String errorExpiredOtp = 'انتهت صلاحية رمز التحقق';
  static const String errorInvalidCredentials = 'البيانات المدخلة غير صحيحة';

  // Success Messages
  static const String successAccountCreated = 'تم إنشاء الحساب بنجاح';
  static const String successOtpSent = 'تم إرسال رمز التحقق بنجاح';
  static const String successOtpResent = 'تم إعادة إرسال رمز التحقق بنجاح';

  // Loading Messages
  static const String loadingPleaseWait = 'الرجاء الانتظار...';
  static const String loadingCreatingAccount = 'جارِ إنشاء الحساب...';
  static const String loadingSendingOtp = 'جارِ إرسال رمز التحقق...';
}