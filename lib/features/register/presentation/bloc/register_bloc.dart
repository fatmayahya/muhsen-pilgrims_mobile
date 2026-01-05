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

      // ✅  password
      emit(RegisterOtpRequested(
        otpRef: otpRef,
        passportNo: event.passportNo,
      ));
    } on Exception catch (e) {
      emit(RegisterFailure(e.toString().replaceAll('Exception: ', '')));
    } catch (e) {
      emit(const RegisterFailure('حدث خطأ غير متوقع'));
    }
  }
}