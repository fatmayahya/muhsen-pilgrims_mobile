import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../constants/route_constants.dart';
import '../network/api_client.dart';
import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
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
    // ═══════════════════════════════════════════════════════════
    // 🔹 Splash
    // ═══════════════════════════════════════════════════════════
    GoRoute(
      path: RouteConstants.splash,
      builder: (context, state) => const SplashPage(),
    ),

    // ═══════════════════════════════════════════════════════════
    // 🔹 Register
    // ═══════════════════════════════════════════════════════════
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

    // ═══════════════════════════════════════════════════════════
    // 🔹 OTP
    // ═══════════════════════════════════════════════════════════
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

    // ═══════════════════════════════════════════════════════════
    // 🔹 Password
    // ═══════════════════════════════════════════════════════════
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
            mobileNo: '', // Not needed in password page
          ),
          child: PasswordPage(
            otpRef: extra['otpRef']!,
            passport: extra['passport']!,
            otpCode: extra['otpCode']!,
          ),
        );
      },
    ),

    // ═══════════════════════════════════════════════════════════
    // 🔹 Home
    // ═══════════════════════════════════════════════════════════
    GoRoute(
      path: RouteConstants.home,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('الرئيسية'),
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle,
                  size: 80,
                  color: AppColors.success,
                ),
                const SizedBox(height: 24),
                Text(
                  'تم إنشاء الحساب بنجاح!',
                  style: AppTextStyles.h2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'مرحباً بك في تطبيق محسن للحجاج',
                  style: AppTextStyles.subtitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to main app
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 16,
                    ),
                  ),
                  child: const Text('استكشاف التطبيق'),
                ),
              ],
            ),
          ),
        );
      },
    ),
  ],
);