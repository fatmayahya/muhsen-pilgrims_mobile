import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/logout_bloc.dart';
import '../bloc/logout_event.dart';
import '../bloc/logout_state.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../../core/themes/app_colors.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          context.go(RouteConstants.register);
        }
      },
      child: ElevatedButton.icon(
        icon: const Icon(Icons.logout),
        label: const Text('تسجيل الخروج'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.error,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () async {
          final confirm = await showDialog<bool>(
            context: context,
            builder: (c) => AlertDialog(
              title: const Text('تسجيل الخروج'),
              content: const Text('هل تريد تسجيل الخروج من التطبيق؟'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(c, false),
                  child: const Text('إلغاء'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(c, true),
                  child: const Text('تأكيد'),
                ),
              ],
            ),
          );

          if (confirm == true && context.mounted) {
            context.read<LogoutBloc>().add(LogoutRequested());
          }
        },
      ),
    );
  }
}
