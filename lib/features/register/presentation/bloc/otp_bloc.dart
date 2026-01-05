import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/activate_otp_usecase.dart';
import '../../domain/usecases/request_otp_usecase.dart';
import 'otp_event.dart';
import 'otp_state.dart';


class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final ActivateOtpUseCase activateOtpUseCase;
  final RequestOtpUseCase requestOtpUseCase;
  final String otpRef;
  final String passport;
  final String mobileNo;

  OtpBloc({
    required this.activateOtpUseCase,
    required this.requestOtpUseCase,
    required this.otpRef,
    required this.passport,
    required this.mobileNo,
  }) : super(OtpInitial()) {
    on<OtpSubmitted>(_onOtpSubmitted);
    on<OtpResendRequested>(_onOtpResendRequested);
  }

  // ═══════════════════════════════════════════════════════════
  // 🔹 Handle OTP Submitted
  // ═══════════════════════════════════════════════════════════

  Future<void> _onOtpSubmitted(
    OtpSubmitted event,
    Emitter<OtpState> emit,
  ) async {
    emit(OtpLoading());

    try {
     
      await activateOtpUseCase(
        otpRef: otpRef,
        passport: passport,
        otp: event.otpCode,
        password: event.password,  
      );

      emit(OtpSuccess());
    } on Exception catch (e) {
      emit(OtpFailure(e.toString().replaceAll('Exception: ', '')));
    } catch (e) {
      emit(const OtpFailure('رمز التحقق غير صحيح'));
    }
  }

  // ═══════════════════════════════════════════════════════════
  // 🔹 Handle OTP Resend
  // ═══════════════════════════════════════════════════════════

  Future<void> _onOtpResendRequested(
    OtpResendRequested event,
    Emitter<OtpState> emit,
  ) async {
    emit(OtpResending());

    try {
      await requestOtpUseCase(
        passportNo: passport,
        mobileNo: mobileNo,
      );

      emit(const OtpResendSuccess('تم إرسال رمز التحقق بنجاح'));
      
      await Future.delayed(const Duration(seconds: 2));
      emit(OtpInitial());
    } on Exception catch (e) {
      emit(OtpFailure(e.toString().replaceAll('Exception: ', '')));
    } catch (e) {
      emit(const OtpFailure('فشل إعادة إرسال رمز التحقق'));
    }
  }
}