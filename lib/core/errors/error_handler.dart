import '../constants/app_strings.dart';

class ErrorHandler {
  ErrorHandler._();

  static String getErrorMessage(dynamic error) {
    final errorString = error.toString().toLowerCase();

    // Duplicate/Already Exists Errors
    if (errorString.contains('duplicate') ||
        errorString.contains('already exists') ||
        errorString.contains('already_registered') ||
        errorString.contains('موجود مسبقاً') ||
        errorString.contains('مسجل')) {
      if (errorString.contains('passport') || errorString.contains('جواز')) {
        return AppStrings.errorDuplicatePassport;
      }
      if (errorString.contains('phone') ||
          errorString.contains('mobile') ||
          errorString.contains('جوال')) {
        return AppStrings.errorDuplicatePhone;
      }
      return AppStrings.errorDuplicatePassport;
    }

    // Invalid OTP
    if (errorString.contains('invalid otp') ||
        errorString.contains('wrong otp') ||
        errorString.contains('incorrect otp') ||
        errorString.contains('رمز التحقق غير صحيح') ||
        errorString.contains('خاطئ')) {
      return AppStrings.errorInvalidOtp;
    }

    // Expired OTP
    if (errorString.contains('expired') ||
        errorString.contains('انتهت صلاحية') ||
        errorString.contains('منتهي')) {
      return AppStrings.errorExpiredOtp;
    }

    // Invalid Credentials
    if (errorString.contains('invalid credentials') ||
        errorString.contains('wrong credentials') ||
        errorString.contains('بيانات غير صحيحة')) {
      return AppStrings.errorInvalidCredentials;
    }

    // Network Errors
    if (errorString.contains('network') ||
        errorString.contains('connection') ||
        errorString.contains('no internet') ||
        errorString.contains('اتصال')) {
      return AppStrings.errorNetwork;
    }

    // Timeout Errors
    if (errorString.contains('timeout') ||
        errorString.contains('time out') ||
        errorString.contains('انتهت المهلة')) {
      return AppStrings.errorTimeout;
    }

    // Server Errors
    if (errorString.contains('server') ||
        errorString.contains('500') ||
        errorString.contains('503') ||
        errorString.contains('خادم')) {
      return AppStrings.errorServer;
    }

    // Default: Return cleaned error message or unknown error
    String cleanedError = error
        .toString()
        .replaceAll('Exception:', '')
        .replaceAll('Exception', '')
        .trim();

    return cleanedError.isNotEmpty && cleanedError.length < 100
        ? cleanedError
        : AppStrings.errorUnknown;
  }
}