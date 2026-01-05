import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/constants/app_constants.dart';  
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../bloc/otp_bloc.dart';
import '../bloc/otp_event.dart';
import '../bloc/otp_state.dart';
import '../widgets/otp_input.dart';

class OtpPage extends StatefulWidget {
  final String otpRef;
  final String passport;
  final String mobileNo;

  const OtpPage({
    super.key,
    required this.otpRef,
    required this.passport,
    required this.mobileNo,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String _otpCode = '';
  
  Timer? _timer;
  int _remainingSeconds = 60;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _remainingSeconds = 60;
      _canResend = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  void _handleOtpCompleted(String code) {
    setState(() {
      _otpCode = code;
    });
  }

  void _handleSubmit() {
    if (_otpCode.length != AppConstants.otpLength) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('الرجاء إدخال رمز التحقق كاملاً'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    
    context.push(
      RouteConstants.password,
      extra: {
        'otpRef': widget.otpRef,
        'passport': widget.passport,
        'otpCode': _otpCode,
      },
    );
  }

  void _handleResend() {
    if (_canResend) {
      context.read<OtpBloc>().add(OtpResendRequested());
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxContentWidth = screenWidth > 600 ? 480.0 : screenWidth;

    return BlocListener<OtpBloc, OtpState>(
      listener: (context, state) {
        if (state is OtpResendSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.success,
            ),
          );
        }

        if (state is OtpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.error,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxContentWidth),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth > 600 ? 32 : 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24),

                    // Header
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'تأكيد رمز التحقق',
                          style: AppTextStyles.h2,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'تم إرسال رمز التحقق إلى رقم الجوال',
                          style: AppTextStyles.subtitle,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.mobileNo,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // OTP Input
                    OtpInput(
                      length: AppConstants.otpLength,
                      onCompleted: _handleOtpCompleted,
                      onChanged: (code) {
                        setState(() {
                          _otpCode = code;
                        });
                      },
                    ),

                    const SizedBox(height: 32),

                    // Submit Button
                    SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        onPressed: _handleSubmit,
                        child: Text(
                          'المتابعة',
                          style: AppTextStyles.buttonLarge,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Resend Button
                    Center(
                      child: BlocBuilder<OtpBloc, OtpState>(
                        builder: (context, state) {
                          if (state is OtpResending) {
                            return const CircularProgressIndicator();
                          }

                          return Column(
                            children: [
                              if (!_canResend) ...[
                                Text(
                                  'إعادة الإرسال بعد $_remainingSeconds ثانية',
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ] else ...[
                                TextButton(
                                  onPressed: _handleResend,
                                  child: Text(
                                    'إعادة إرسال الرمز',
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}