class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashStarted>(_onSplashStarted);
  }

  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashLoading());

    await Future.delayed(const Duration(seconds: 2));

    final bool hasToken = false; // لاحقًا من SecureStorage

    if (hasToken) {
      emit(SplashGoToHome());
    } else {
      emit(SplashGoToSignup());
    }
  }
}
