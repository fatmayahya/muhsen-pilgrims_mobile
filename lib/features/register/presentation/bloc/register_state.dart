import 'package:equatable/equatable.dart';


abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}


class RegisterInitial extends RegisterState {}


class RegisterLoading extends RegisterState {}


class RegisterOtpRequested extends RegisterState {
  final String otpRef;
  final String passportNo;
 

  const RegisterOtpRequested({
    required this.otpRef,
    required this.passportNo,
  });

  @override
  List<Object?> get props => [otpRef, passportNo];
}


class RegisterFailure extends RegisterState {
  final String message;

  const RegisterFailure(this.message);

  @override
  List<Object?> get props => [message];
}