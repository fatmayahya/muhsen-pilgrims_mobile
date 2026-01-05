import 'package:equatable/equatable.dart';


class OtpActivateModel extends Equatable {
  final String otpRef;
  final String passportNo;
  final String otpCode;
  final String password;

  const OtpActivateModel({
    required this.otpRef,
    required this.passportNo,
    required this.otpCode,
    required this.password,
  });

  // ═══════════════════════════════════════════════════════════
  // 🔹 JSON Serialization
  // ═══════════════════════════════════════════════════════════

  Map<String, dynamic> toJson() => {
        'otp_ref': otpRef,
        'passport_no': passportNo,
        'otp_code': otpCode,
        'password': password,
      };

  factory OtpActivateModel.fromJson(Map<String, dynamic> json) {
    return OtpActivateModel(
      otpRef: json['otp_ref'] as String,
      passportNo: json['passport_no'] as String,
      otpCode: json['otp_code'] as String,
      password: json['password'] as String,
    );
  }

  // ═══════════════════════════════════════════════════════════
  // 🔹 CopyWith
  // ═══════════════════════════════════════════════════════════

  OtpActivateModel copyWith({
    String? otpRef,
    String? passportNo,
    String? otpCode,
    String? password,
  }) {
    return OtpActivateModel(
      otpRef: otpRef ?? this.otpRef,
      passportNo: passportNo ?? this.passportNo,
      otpCode: otpCode ?? this.otpCode,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [otpRef, passportNo, otpCode, password];
}