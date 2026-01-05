import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';

import '../bloc/register_bloc.dart';
import '../bloc/register_event.dart';
import '../bloc/register_state.dart';
import '../widgets/passport_field.dart';
import '../widgets/phone_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _passportController = TextEditingController();
  final _phoneController = TextEditingController();
  
  String _completePhoneNumber = '';

  @override
  void dispose() {
    _passportController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<RegisterBloc>().add(
            RegisterSubmitted(
              passportNo: _passportController.text,
              mobileNo: _completePhoneNumber,
              password: '',
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    final maxContentWidth = screenWidth > 600 ? 480.0 : screenWidth;
    final topPadding = screenHeight < 700 ? 24.0 : 48.0;
    final headerSpacing = screenHeight < 700 ? 24.0 : 40.0;
    final fieldSpacing = screenHeight < 700 ? 16.0 : 20.0;
    final buttonSpacing = screenHeight < 700 ? 24.0 : 32.0;

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterOtpRequested) {
          context.go(
            RouteConstants.otp,
            extra: {
              'otpRef': state.otpRef,
              'passport': state.passportNo,
              'mobileNo': _completePhoneNumber,
            },
          );
        }

        if (state is RegisterFailure) {
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
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxContentWidth),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth > 600 ? 32 : 24,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: topPadding),

                      Column(
                        children: [
                          Text(
                            'تسجيل حساب جديد',
                            style: AppTextStyles.h2,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'مرحباً بك معنا',
                            style: AppTextStyles.subtitleSmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),

                      SizedBox(height: headerSpacing),

                      PassportField(controller: _passportController),

                      SizedBox(height: fieldSpacing),

                      PhoneField(
                        controller: _phoneController,
                        onPhoneChanged: (completeNumber) {
                          setState(() {
                            _completePhoneNumber = completeNumber;
                          });
                        },
                      ),

                      SizedBox(height: buttonSpacing),

                      BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                          return SizedBox(
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
                              onPressed: state is RegisterLoading 
                                  ? null 
                                  : _handleSubmit,
                              child: state is RegisterLoading
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                          AppColors.white,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      'إنشاء حساب',
                                      style: AppTextStyles.buttonLarge,
                                    ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textPrimary,
                            ),
                            children: [
                              const TextSpan(text: 'لديك حساب؟ '),
                              TextSpan(
                                text: 'تسجيل الدخول',
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.go(RouteConstants.login);
                                  },
                              ),
                            ],
                          ),
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
      ),
    );
  }
}