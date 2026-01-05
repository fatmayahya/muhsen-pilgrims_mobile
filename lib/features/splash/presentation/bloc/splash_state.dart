import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class SplashLoading extends SplashState {
  const SplashLoading();
}

class SplashGoToHome extends SplashState {
  const SplashGoToHome();
}

class SplashGoToSignup extends SplashState {
  const SplashGoToSignup();
}