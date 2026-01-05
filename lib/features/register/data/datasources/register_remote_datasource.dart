import 'dart:convert';

import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';


class RegisterRemoteDataSource {
  final ApiClient apiClient;

  RegisterRemoteDataSource(this.apiClient);

  // ═══════════════════════════════════════════════════════════
  // 🔹 Request OTP
  // ═══════════════════════════════════════════════════════════

  
  Future<String> requestOtp({
    required String passportNo,
    required String mobileNo,
  }) async {
    try {
      final response = await apiClient.post(
        ApiConstants.otpRequest,
        data: {
          "passport_no": passportNo,
          "mobile_no": mobileNo,
          "purpose": "ACTIVATE",
        },
      );

      print('📦 Response Status Code: ${response.statusCode}');
      print('📦 Response Data Type: ${response.data.runtimeType}');
      print('📦 Response Data: ${response.data}');

      // ═══════════════════════════════════════════════════════
      //  Parse JSON if it's a String
      // ═══════════════════════════════════════════════════════
      
      Map<String, dynamic> jsonData;
      
      if (response.data is String) {
        print('🔄 Parsing JSON string...');
        jsonData = json.decode(response.data);
      } else if (response.data is Map<String, dynamic>) {
        print('✅ Data is already a Map');
        jsonData = response.data;
      } else {
        print('❌ Unexpected data type: ${response.data.runtimeType}');
        throw Exception('تنسيق الاستجابة غير صحيح');
      }

      print('📦 Parsed JSON: $jsonData');

      // ═══════════════════════════════════════════════════════
      // success flag
      // ═══════════════════════════════════════════════════════
      
      final success = jsonData['success'];
      print('📊 Success flag: $success (type: ${success.runtimeType})');
      
      if (success == 0 || success == false || success == '0') {
        //error object أو string
        String errorMessage = 'فشل طلب رمز التحقق';
        
        if (jsonData['error'] != null) {
          final error = jsonData['error'];
          if (error is Map) {
            // error is an object with message
            errorMessage = error['message'] ?? errorMessage;
          } else if (error is String) {
            // error is a string
            errorMessage = error;
          }
        } else if (jsonData['message'] != null) {
          errorMessage = jsonData['message'];
        }
        
        print('❌ API returned success: 0 - $errorMessage');
        throw Exception(errorMessage);
      }

      // ═══════════════════════════════════════════════════════
     
      final data = jsonData['data'];
      if (data == null) {
        print('❌ No data field in response');
        throw Exception('بيانات الاستجابة مفقودة');
      }

      final otpRef = data['otp_ref'];
      print('🔑 OTP Ref: $otpRef');

      if (otpRef == null || otpRef.toString().isEmpty) {
        print('❌ OTP Ref is null or empty');
        throw Exception('مرجع OTP مفقود');
      }

      print('✅ OTP Request successful! Ref: $otpRef');
      return otpRef.toString();
      
    } catch (e) {
      print('❌ Error in requestOtp: $e');
      rethrow;
    }
  }

  // ═══════════════════════════════════════════════════════════
  // 🔹 Activate OTP
  // ═══════════════════════════════════════════════════════════


  Future<void> activateOtp({
    required String otpRef,
    required String passportNo,
    required String otpCode,
    required String password,
  }) async {
    try {
      final response = await apiClient.post(
        ApiConstants.otpActivate,
        data: {
          "otp_ref": otpRef,
          "passport_no": passportNo,
          "otp_code": otpCode,
          "password": password,
        },
      );

      print('📦 Activate Response Data Type: ${response.data.runtimeType}');
      print('📦 Activate Response: ${response.data}');

      // Parse JSON if it's a String
      Map<String, dynamic> jsonData;
      
      if (response.data is String) {
        jsonData = json.decode(response.data);
      } else if (response.data is Map<String, dynamic>) {
        jsonData = response.data;
      } else {
        throw Exception('تنسيق الاستجابة غير صحيح');
      }

      final success = jsonData['success'];
      if (success == 0 || success == false || success == '0') {
      
        String errorMessage = 'رمز التحقق غير صحيح';
        
        if (jsonData['error'] != null) {
          final error = jsonData['error'];
          if (error is Map) {
            // error is an object with message
            errorMessage = error['message'] ?? errorMessage;
          } else if (error is String) {
            // error is a string
            errorMessage = error;
          }
        } else if (jsonData['message'] != null) {
          errorMessage = jsonData['message'];
        }
        
        print('❌ Activation failed: $errorMessage');
        throw Exception(errorMessage);
      }

      print('✅ OTP Activation successful!');
      
    } catch (e) {
      print('❌ Error in activateOtp: $e');
      rethrow;
    }
  }
}