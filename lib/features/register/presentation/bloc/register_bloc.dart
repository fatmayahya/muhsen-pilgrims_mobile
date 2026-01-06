import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/request_otp_usecase.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RequestOtpUseCase requestOtpUseCase;

  RegisterBloc(this.requestOtpUseCase) : super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());

    try {
      final otpRef = await requestOtpUseCase(
        passportNo: event.passportNo,
        mobileNo: event.mobileNo,
      );

      emit(RegisterOtpRequested(
        otpRef: otpRef,
        passportNo: event.passportNo,
      ));
    } catch (e) {
      // Extract error message properly
      String errorMessage = e.toString();
      
      // Remove 'Exception: ' prefix if exists
      if (errorMessage.startsWith('Exception: ')) {
        errorMessage = errorMessage.substring(11);
      }
      
      // If error contains ALREADY_REGISTERED
      if (errorMessage.contains('ALREADY_REGISTERED') || 
          errorMessage.toLowerCase().contains('already registered')) {
        errorMessage = 'رقم الجواز مسجل مسبقاً';
      }
      
      emit(RegisterFailure(errorMessage));
    }
  }
}