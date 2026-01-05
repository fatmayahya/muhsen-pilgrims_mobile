import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../constants/route_constants.dart';
import '../network/api_client.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/register/presentation/pages/register_page.dart';
import '../../features/register/presentation/pages/otp_page.dart';
import '../../features/register/presentation/pages/password_page.dart';
import '../../features/register/presentation/bloc/register_bloc.dart';
import '../../features/register/presentation/bloc/otp_bloc.dart';
import '../../features/register/domain/usecases/request_otp_usecase.dart';
import '../../features/register/domain/usecases/activate_otp_usecase.dart';
import '../../features/register/data/repositories/register_repository_impl.dart';
import '../../features/register/data/datasources/register_remote_datasource.dart';

late final ApiClient apiClient;

final GoRouter appRouter = GoRouter(
  initialLocation: RouteConstants.splash,
  routes: [
    GoRoute(
      path: RouteConstants.splash,
      builder: (context, state) => const SplashPage(),
    ),

    GoRoute(
      path: RouteConstants.register,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => RegisterBloc(
            RequestOtpUseCase(
              RegisterRepositoryImpl(
                RegisterRemoteDataSource(apiClient),
              ),
            ),
          ),
          child: const RegisterPage(),
        );
      },
    ),

    GoRoute(
      path: RouteConstants.otp,
      builder: (context, state) {
        final extra = state.extra as Map<String, String>;

        final repository = RegisterRepositoryImpl(
          RegisterRemoteDataSource(apiClient),
        );

        return BlocProvider(
          create: (_) => OtpBloc(
            activateOtpUseCase: ActivateOtpUseCase(repository),
            requestOtpUseCase: RequestOtpUseCase(repository),
            otpRef: extra['otpRef']!,
            passport: extra['passport']!,
            mobileNo: extra['mobileNo']!,
          ),
          child: OtpPage(
            otpRef: extra['otpRef']!,
            passport: extra['passport']!,
            mobileNo: extra['mobileNo']!,
          ),
        );
      },
    ),

    GoRoute(
      path: RouteConstants.password,
      builder: (context, state) {
        final extra = state.extra as Map<String, String>;

        final repository = RegisterRepositoryImpl(
          RegisterRemoteDataSource(apiClient),
        );

        return BlocProvider(
          create: (_) => OtpBloc(
            activateOtpUseCase: ActivateOtpUseCase(repository),
            requestOtpUseCase: RequestOtpUseCase(repository),
            otpRef: extra['otpRef']!,
            passport: extra['passport']!,
            mobileNo: '',
          ),
          child: PasswordPage(
            otpRef: extra['otpRef']!,
            passport: extra['passport']!,
            otpCode: extra['otpCode']!,
          ),
        );
      },
    ),

    GoRoute(
      path: RouteConstants.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);