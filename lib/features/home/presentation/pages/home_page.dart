import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../register/presentation/bloc/logout_bloc.dart';
import '../../../register/presentation/widgets/logout_button.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الرئيسية'),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: BlocProvider(
          create: (_) => LogoutBloc(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                size: 90,
                color: AppColors.primary,
              ),
              const SizedBox(height: 16),
              Text(
                'تم إنشاء الحساب بنجاح!',
                style: AppTextStyles.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'مرحباً بك في تطبيق محسن للحجاج',
                style: AppTextStyles.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              /// 🔴 زر تسجيل الخروج (موديول مستقل)
              const LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
