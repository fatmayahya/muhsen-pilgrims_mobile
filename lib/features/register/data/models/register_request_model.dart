import 'package:equatable/equatable.dart';


class RegisterRequestModel extends Equatable {
  final String passportNo;
  final String mobileNo;
  final String password;

  const RegisterRequestModel({
    required this.passportNo,
    required this.mobileNo,
    required this.password,
  });

  // ═══════════════════════════════════════════════════════════
  // 🔹 Validation
  // ═══════════════════════════════════════════════════════════

  bool get isValid {
    return passportNo.isNotEmpty &&
        mobileNo.isNotEmpty &&
        password.isNotEmpty &&
        password.length >= 8;
  }

  // ═══════════════════════════════════════════════════════════
  // 🔹 JSON Serialization
  // ═══════════════════════════════════════════════════════════

  Map<String, dynamic> toJson() => {
        'passport_no': passportNo,
        'mobile_no': mobileNo,
        'password': password,
      };

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
      passportNo: json['passport_no'] as String,
      mobileNo: json['mobile_no'] as String,
      password: json['password'] as String,
    );
  }

  // ═══════════════════════════════════════════════════════════
  // 🔹 CopyWith
  // ═══════════════════════════════════════════════════════════

  RegisterRequestModel copyWith({
    String? passportNo,
    String? mobileNo,
    String? password,
  }) {
    return RegisterRequestModel(
      passportNo: passportNo ?? this.passportNo,
      mobileNo: mobileNo ?? this.mobileNo,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [passportNo, mobileNo, password];
}