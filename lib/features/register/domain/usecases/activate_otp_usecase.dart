import '../repositories/register_repository.dart';


class ActivateOtpUseCase {
  final RegisterRepository repository;

  ActivateOtpUseCase(this.repository);

  
  Future<void> call({
    required String otpRef,
    required String passport,
    required String otp,
    required String password,
  }) async {
    // Validation
    if (otpRef.trim().isEmpty) {
      throw Exception('رمز OTP Reference مفقود');
    }

    if (passport.trim().isEmpty) {
      throw Exception('رقم الجواز مطلوب');
    }

    if (otp.trim().isEmpty) {
      throw Exception('رمز التحقق مطلوب');
    }

    if (otp.length != 4) {
      throw Exception('رمز التحقق يجب أن يكون 4 أرقام');
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(otp)) {
      throw Exception('رمز التحقق يجب أن يحتوي على أرقام فقط');
    }

  
    if (password.trim().isEmpty) {
      throw Exception('كلمة المرور مطلوبة');
    }

    if (password.length < 8) {
      throw Exception('كلمة المرور يجب أن تكون 8 أحرف على الأقل');
    }

    await repository.activateOtp(
      otpRef: otpRef.trim(),
      passportNo: passport.trim(),
      otpCode: otp.trim(),
      password: password.trim(),
    );
  }
}