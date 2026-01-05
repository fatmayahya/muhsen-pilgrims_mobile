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
      passportNo: passportNo.trim(),
      mobileNo: cleanedMobile,
    );
  }

  String _formatPhoneForAPI(String phone) {
    String cleaned = phone.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    if (cleaned.startsWith('+')) {
      cleaned = cleaned.substring(1);
    }

    if (cleaned.startsWith('00')) {
      cleaned = cleaned.substring(2);
    }

    if (cleaned.startsWith('05')) {
      cleaned = '966${cleaned.substring(1)}';
    }

    if (cleaned.length == 9 && cleaned.startsWith('5')) {
      cleaned = '966$cleaned';
    }

    return cleaned;
  }
}