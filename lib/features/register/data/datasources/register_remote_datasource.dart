import 'dart:convert';

import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';

class RegisterRemoteDataSource {
  final ApiClient apiClient;

  RegisterRemoteDataSource(this.apiClient);

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

      Map<String, dynamic> jsonData;

      if (response.data is String) {
        jsonData = json.decode(response.data);
      } else if (response.data is Map<String, dynamic>) {
        jsonData = response.data;
      } else {
        throw Exception('Invalid response format');
      }

      final success = jsonData['success'];

      if (success == 0 || success == false || success == '0') {
        String errorMessage = 'Failed to request OTP';

        if (jsonData['error'] != null) {
          final error = jsonData['error'];
          if (error is Map) {
            errorMessage = error['message'] ?? errorMessage;
          } else if (error is String) {
            errorMessage = error;
          }
        } else if (jsonData['message'] != null) {
          errorMessage = jsonData['message'];
        }

        throw Exception(errorMessage);
      }

      final data = jsonData['data'];
      if (data == null) {
        throw Exception('Response data is missing');
      }

      final otpRef = data['otp_ref'];

      if (otpRef == null || otpRef.toString().isEmpty) {
        throw Exception('OTP reference is missing');
      }

      return otpRef.toString();
    } catch (e) {
      rethrow;
    }
  }

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

      Map<String, dynamic> jsonData;

      if (response.data is String) {
        jsonData = json.decode(response.data);
      } else if (response.data is Map<String, dynamic>) {
        jsonData = response.data;
      } else {
        throw Exception('Invalid response format');
      }

      final success = jsonData['success'];
      if (success == 0 || success == false || success == '0') {
        String errorMessage = 'Invalid OTP code';

        if (jsonData['error'] != null) {
          final error = jsonData['error'];
          if (error is Map) {
            errorMessage = error['message'] ?? errorMessage;
          } else if (error is String) {
            errorMessage = error;
          }
        } else if (jsonData['message'] != null) {
          errorMessage = jsonData['message'];
        }

        throw Exception(errorMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}