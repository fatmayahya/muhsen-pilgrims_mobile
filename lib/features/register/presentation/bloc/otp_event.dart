import 'package:equatable/equatable.dart';


abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object?> get props => [];
}


class OtpSubmitted extends OtpEvent {
  final String otpCode;
  final String password; 

  const OtpSubmitted(this.otpCode, this.password);

  @override
  List<Object?> get props => [otpCode, password];
}


class OtpResendRequested extends OtpEvent {}