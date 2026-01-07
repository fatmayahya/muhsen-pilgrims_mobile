import 'dart:convert';

import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_strings.dart';

class RegisterRemoteDataSource {
  final ApiClient apiClient;

  RegisterRemoteDataSource(this.apiClient);

  Future<String> requestOtp({
    required String passportNo,
    required String mobileNo,
  }) async {
    
    
    final response = await apiClient.post(
      ApiConstants.otpRequest,
      data: {
        "passport_no": passportNo,
        "mobile_no": mobileNo,
        "purpose": "ACTIVATE",
      },
    );

    
    // Parse JSON safely
    Map<String, dynamic> jsonData;

    if (response.data is String) {
      jsonData = json.decode(response.data);
    } else if (response.data is Map<String, dynamic>) {
      jsonData = response.data;
    } else {
      throw Exception(AppStrings.errorUnknown);
    }


    // Check success
    final success = jsonData['success'];

    if (success == 0 || success == false || success == '0') {
      
      // Extract error
      if (jsonData['error'] != null) {
        final error = jsonData['error'];
        
        if (error is Map) {
          final code = error['code']?.toString() ?? '';
          final message = error['message']?.toString() ?? '';
          
       
          
          // ✅ CHECK FOR ALREADY_REGISTERED CODE FIRST
          if (code == 'ALREADY_REGISTERED') {
            throw Exception(AppStrings.errorDuplicatePassport);
          }
          
          // Check message
          if (message.toLowerCase().contains('already registered') ||
              message.toLowerCase().contains('already exists')) {
            throw Exception(AppStrings.errorDuplicatePassport);
          }
          
          // Return message if available
          if (message.isNotEmpty) {
          
            throw Exception(message);
          }
        } else if (error is String) {
          if (error.toLowerCase().contains('already registered')) {
            throw Exception(AppStrings.errorDuplicatePassport);
          }
          throw Exception(error);
        }
      } else if (jsonData['message'] != null) {
        final message = jsonData['message'].toString();
      
        if (message.toLowerCase().contains('already registered')) {
          throw Exception(AppStrings.errorDuplicatePassport);
        }
        throw Exception(message);
      }

    
      throw Exception(AppStrings.errorUnknown);
    }



    // Extract OTP ref
    final data = jsonData['data'];
    if (data == null) {
      throw Exception('البيانات المطلوبة غير موجودة');
    }

    final otpRef = data['otp_ref'];

    if (otpRef == null || otpRef.toString().isEmpty) {
      throw Exception('رمز التحقق غير موجود');
    }


    return otpRef.toString();
  }

  Future<void> activateOtp({
    required String otpRef,
    required String passportNo,
    required String otpCode,
    required String password,
  }) async {
    final response = await apiClient.post(
      ApiConstants.otpActivate,
      data: {
        "otp_ref": otpRef,
        "passport_no": passportNo,
        "otp_code": otpCode,
        "password": password,
      },
    );

    // Parse JSON
    Map<String, dynamic> jsonData;

    if (response.data is String) {
      jsonData = json.decode(response.data);
    } else if (response.data is Map<String, dynamic>) {
      jsonData = response.data;
    } else {
      throw Exception(AppStrings.errorUnknown);
    }

    // Check success
    final success = jsonData['success'];
    
    if (success == 0 || success == false || success == '0') {
      if (jsonData['error'] != null) {
        final error = jsonData['error'];
        
        if (error is Map) {
          final code = error['code']?.toString() ?? '';
          final message = error['message']?.toString() ?? '';
          
          if (code == 'INVALID_OTP' || message.toLowerCase().contains('invalid')) {
            throw Exception(AppStrings.errorInvalidOtp);
          }
          
          if (code == 'EXPIRED_OTP' || message.toLowerCase().contains('expired')) {
            throw Exception(AppStrings.errorExpiredOtp);
          }
          
          if (message.isNotEmpty) {
            throw Exception(message);
          }
        } else if (error is String) {
          throw Exception(error);
        }
      } else if (jsonData['message'] != null) {
        throw Exception(jsonData['message'].toString());
      }

      throw Exception(AppStrings.errorInvalidOtp);
    }
  }
}