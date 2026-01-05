import '../repositories/register_repository.dart';

/// 📨 UseCase لطلب رمز OTP
/// 
/// يحتوي على منطق العمل لطلب رمز التحقق
class RequestOtpUseCase {
  final RegisterRepository repository;

  RequestOtpUseCase(this.repository);

  /// تنفيذ العملية
  Future<String> call({
    required String passportNo,
    required String mobileNo,
  }) async {
    // Validation
    if (passportNo.trim().isEmpty) {
      throw Exception('رقم الجواز مطلوب');
    }

    if (mobileNo.trim().isEmpty) {
      throw Exception('رقم الجوال مطلوب');
    }

    // ═══════════════════════════════════════════════════════════
    // 🔹 تنظيف وتحويل الرقم الدولي
    // ═══════════════════════════════════════════════════════════
    
    String cleanedMobile = _formatPhoneForAPI(mobileNo);

    return await repository.requestOtp(
      passportNo: passportNo.trim(),
      mobileNo: cleanedMobile,
    );
  }

  // ═══════════════════════════════════════════════════════════
  // 🔹 Helper Methods
  // ═══════════════════════════════════════════════════════════

  
  /// 
  /// Examples:
  /// +966501234567 → 966501234567
  /// 00966501234567 → 966501234567
  /// 0501234567 → 966501234567 
  String _formatPhoneForAPI(String phone) {
   
    String cleaned = phone.replaceAll(RegExp(r'[\s\-\(\)]'), '');

  
    if (cleaned.startsWith('+')) {
      cleaned = cleaned.substring(1);
    }

  
    if (cleaned.startsWith('00')) {
      cleaned = cleaned.substring(2);
    }

  
    if (cleaned.startsWith('05')) {
      cleaned = '966${cleaned.substring(1)}'; // 05 → 9665
    }

  
    if (cleaned.length == 9 && cleaned.startsWith('5')) {
      cleaned = '966$cleaned';
    }

    return cleaned;
  }
}