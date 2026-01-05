import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../core/utils/app_validators.dart';


class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?)? additionalValidator;
  final bool showStrengthIndicator;
  final TextInputAction? textInputAction;

  const PasswordField({
    super.key,
    required this.controller,
    this.label = 'كلمة المرور',
    this.hint = '••••••••',
    this.additionalValidator,
    this.showStrengthIndicator = false,
    this.textInputAction,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          label: widget.label,
          hint: widget.hint,
          controller: widget.controller,
          obscureText: _obscureText,
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          
          validator: AppValidators.compose([
            (v) => AppValidators.required(v, widget.label),
            AppValidators.password,
            if (widget.additionalValidator != null) 
              widget.additionalValidator!,
          ]),

          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: AppColors.grey600,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),

          prefixIcon: const Icon(Icons.lock_outline),
        ),

        
        if (widget.showStrengthIndicator && widget.controller.text.isNotEmpty) ...[
          const SizedBox(height: 8),
          _PasswordStrengthIndicator(
            password: widget.controller.text,
          ),
        ],
      ],
    );
  }
}


class _PasswordStrengthIndicator extends StatelessWidget {
  final String password;

  const _PasswordStrengthIndicator({required this.password});

  @override
  Widget build(BuildContext context) {
    final strength = _calculateStrength(password);
    final color = _getColorForStrength(strength);
    final text = _getTextForStrength(strength);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: strength / 4,
          backgroundColor: AppColors.grey300,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  int _calculateStrength(String password) {
  
    if (password.isEmpty) return 0;
    
    int strength = 0;
    
    if (password.length >= 8) strength++;
    if (password.contains(RegExp(r'[A-Z]'))) strength++;
    if (password.contains(RegExp(r'[a-z]'))) strength++;
    if (password.contains(RegExp(r'[0-9]'))) strength++;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength++;

    return strength > 4 ? 4 : strength;
  }

  Color _getColorForStrength(int strength) {
    switch (strength) {
      case 0:
      case 1:
        return AppColors.error;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.amber;
      case 4:
        return AppColors.success;
      default:
        return AppColors.error;
    }
  }

  String _getTextForStrength(int strength) {
    switch (strength) {
      case 0:
      case 1:
        return 'ضعيفة جداً';
      case 2:
        return 'ضعيفة';
      case 3:
        return 'متوسطة';
      case 4:
        return 'قوية';
      default:
        return 'ضعيفة جداً';
    }
  }
}