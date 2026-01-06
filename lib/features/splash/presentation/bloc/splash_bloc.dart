import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    final isLoggedIn = token != null && token.isNotEmpty;

    if (isLoggedIn) {
      emit(const SplashGoToHome());
    } else {
      emit(const SplashGoToSignup());
    }
  }
}