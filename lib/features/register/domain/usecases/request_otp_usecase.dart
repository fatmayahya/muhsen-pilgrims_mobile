import '../repositories/register_repository.dart';

class RequestOtpUseCase {
  final RegisterRepository repository;

  RequestOtpUseCase(this.repository);

  Future<String> call({
    required String passportNo,
    required String mobileNo,
  }) async {
    if (passportNo.trim().isEmpty) {
      throw Exception('Passport number is required');
    }

    if (mobileNo.trim().isEmpty) {
      throw Exception('Mobile number is required');
    }

    final cleanedMobile = _formatPhoneForAPI(mobileNo);

    return await repository.requestOtp(
      passportNo: passportNo.trim().toUpperCase(),
      mobileNo: cleanedMobile,
    );
  }

  String _formatPhoneForAPI(String phone) {
    if (phone.isEmpty) return phone;

    // Remove all whitespace and special characters
    String cleaned = phone.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    // Remove leading +
    if (cleaned.startsWith('+')) {
      cleaned = cleaned.substring(1);
    }

    // Remove leading 00
    if (cleaned.startsWith('00') && cleaned.length > 2) {
      cleaned = cleaned.substring(2);
    }

    // Handle 05 prefix (Saudi format)
    if (cleaned.startsWith('05') && cleaned.length > 2) {
      cleaned = '966${cleaned.substring(1)}';
    }

    // Handle single 5 with 9 digits (Saudi mobile without prefix)
    if (cleaned.startsWith('5') && cleaned.length == 9) {
      cleaned = '966$cleaned';
    }

    // Remove duplicate 966 prefix (9660...)
    if (cleaned.startsWith('9660') && cleaned.length > 4) {
      cleaned = '966${cleaned.substring(4)}';
    }

    return cleaned;
  }
}