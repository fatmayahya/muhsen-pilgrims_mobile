
class AppValidators {
  AppValidators._();

  // ═══════════════════════════════════════════════════════════
  // 🔹 Basic Validators
  // ═══════════════════════════════════════════════════════════

 
  static String? required(String? value, [String fieldName = 'الحقل']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName مطلوب';
    }
    return null;
  }


  static String? minLength(String? value, int min, [String fieldName = 'الحقل']) {
    if (value == null || value.isEmpty) return null;
    if (value.length < min) {
      return '$fieldName يجب أن يكون $min أحرف على الأقل';
    }
    return null;
  }


  static String? maxLength(String? value, int max, [String fieldName = 'الحقل']) {
    if (value == null || value.isEmpty) return null;
    if (value.length > max) {
      return '$fieldName يجب ألا يتجاوز $max حرف';
    }
    return null;
  }

  // ═══════════════════════════════════════════════════════════
  // 🔹 Specialized Validators
  // ═══════════════════════════════════════════════════════════

 
  static String? email(String? value) {
    if (value == null || value.isEmpty) return null;

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'البريد الإلكتروني غير صحيح';
    }
    return null;
  }

  
  static String? saudiPhone(String? value) {
    if (value == null || value.isEmpty) return null;


    final cleaned = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');


    final phoneRegex = RegExp(r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$');

    if (!phoneRegex.hasMatch(cleaned)) {
      return 'رقم الجوال غير صحيح';
    }
    return null;
  }

 
  static String? password(String? value) {
    if (value == null || value.isEmpty) return null;

    if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
    }

  
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'يجب أن تحتوي على حرف كبير واحد على الأقل';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'يجب أن تحتوي على حرف صغير واحد على الأقل';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'يجب أن تحتوي على رقم واحد على الأقل';
    }

    return null;
  }

 
  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) return null;

    if (value != password) {
      return 'كلمة المرور غير متطابقة';
    }
    return null;
  }


  static String? otp(String? value) {
    if (value == null || value.isEmpty) return null;

    if (value.length != 4) {
      return 'رمز التحقق يجب أن يكون 4 أرقام';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'رمز التحقق يجب أن يحتوي على أرقام فقط';
    }

    return null;
  }

 
  static String? numbersOnly(String? value, [String fieldName = 'الحقل']) {
    if (value == null || value.isEmpty) return null;

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return '$fieldName يجب أن يحتوي على أرقام فقط';
    }
    return null;
  }


  static String? lettersOnly(String? value, [String fieldName = 'الحقل']) {
    if (value == null || value.isEmpty) return null;

    if (!RegExp(r'^[a-zA-Zأ-ي\s]+$').hasMatch(value)) {
      return '$fieldName يجب أن يحتوي على أحرف فقط';
    }
    return null;
  }

  // ═══════════════════════════════════════════════════════════
  // 🔹 Composite Validators
  // ═══════════════════════════════════════════════════════════


  static String? Function(String?) compose(
    List<String? Function(String?)> validators,
  ) {
    return (value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) return error;
      }
      return null;
    };
  }
}

/// 🔧 أمثلة على الاستخدام:
/// 
/// AppTextField(
///   validator: AppValidators.compose([
///     (v) => AppValidators.required(v, 'الاسم'),
///     (v) => AppValidators.minLength(v, 3, 'الاسم'),
///     AppValidators.lettersOnly,
///   ]),
/// )