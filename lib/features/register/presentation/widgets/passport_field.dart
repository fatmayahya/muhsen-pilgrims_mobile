import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../core/utils/app_validators.dart';


class PassportField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? additionalValidator;

  const PassportField({
    super.key,
    required this.controller,
    this.additionalValidator,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: 'رقم الجواز',
      hint: 'أدخل رقم الجواز',
      controller: controller,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      
     
      inputFormatters: [
        UpperCaseTextFormatter(),
        FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
      ],

      validator: AppValidators.compose([
        (v) => AppValidators.required(v, 'رقم الجواز'),
        (v) => AppValidators.minLength(v, 6, 'رقم الجواز'),
        if (additionalValidator != null) additionalValidator!,
      ]),

      prefixIcon: const Icon(Icons.badge_outlined),
    );
  }
}

/// محول النص لأحرف كبيرة
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
