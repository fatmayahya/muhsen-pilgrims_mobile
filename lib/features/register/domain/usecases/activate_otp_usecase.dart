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
    if (otpRef.trim().isEmpty) {
      throw Exception('OTP Reference is missing');
    }

    if (passport.trim().isEmpty) {
      throw Exception('Passport number is required');
    }

    if (otp.trim().isEmpty) {
      throw Exception('OTP code is required');
    }

    if (otp.length != 4) {
      throw Exception('OTP code must be 4 digits');
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(otp)) {
      throw Exception('OTP code must contain only numbers');
    }

    if (password.trim().isEmpty) {
      throw Exception('Password is required');
    }

    if (password.length < 8) {
      throw Exception('Password must be at least 8 characters');
    }

    await repository.activateOtp(
      otpRef: otpRef.trim(),
      passportNo: passport.trim(),
      otpCode: otp.trim(),
      password: password.trim(),
    );
  }
}