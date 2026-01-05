import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashInitial()) {
    on<SplashStarted>(_onSplashStarted);
  }

  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    emit(const SplashLoading());

    await Future.delayed(const Duration(seconds: 2));

    // Check if user is logged in
    const isLoggedIn = false;

    if (isLoggedIn) {
      emit(const SplashGoToHome());
    } else {
      emit(const SplashGoToSignup());
    }
  }
}