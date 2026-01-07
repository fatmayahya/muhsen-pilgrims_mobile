import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onPhoneChanged;
  final String? Function(String?)? additionalValidator;

  const PhoneField({
    super.key,
    required this.controller,
    this.onPhoneChanged,
    this.additionalValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'رقم الجوال',
          style: AppTextStyles.labelSecondary,
        ),
        const SizedBox(height: 6),

        IntlPhoneField(
          controller: controller,
          initialCountryCode: 'SA',
          textAlign: TextAlign.right,
          style: AppTextStyles.input,
          dropdownTextStyle: AppTextStyles.bodySmall,
          
          decoration: InputDecoration(
            hintText: '5XXXXXXXX',
            hintStyle: AppTextStyles.hint,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.border,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.border,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.error,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.error,
                width: 1.5,
              ),
            ),
          ),

          dropdownIconPosition: IconPosition.trailing,
          dropdownIcon: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.grey400,
          ),

          showCountryFlag: true,
          showDropdownIcon: true,
          
          onChanged: (phone) {
            if (onPhoneChanged != null && phone.completeNumber.isNotEmpty) {
              final cleanedNumber = _cleanPhoneNumber(phone.completeNumber);
              onPhoneChanged!(cleanedNumber);
            }
          },

          validator: (phone) {
            if (phone == null || phone.number.isEmpty) {
              return 'رقم الجوال مطلوب';
            }
            return null;
          },

          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          disableLengthCheck: true,
        ),
      ],
    );
  }

  String _cleanPhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) return phoneNumber;
    
    // Remove + and spaces
    String cleaned = phoneNumber.replaceAll('+', '').replaceAll(' ', '');
    
    // Safe check: make sure string is long enough before substring
    if (cleaned.length > 4 && cleaned.startsWith('9660')) {
      cleaned = '966${cleaned.substring(4)}';
    }
    
    return cleaned;
  }
}