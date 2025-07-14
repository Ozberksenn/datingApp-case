import 'package:datingapp/product/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  const TextFieldWidget({
    super.key,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: labelText,
        prefixIcon:
            prefixIcon != null
                ? Icon(prefixIcon, color: AppColors.white, size: 22)
                : null,
        suffixIcon:
            suffixIcon != null
                ? Icon(suffixIcon, color: AppColors.lightGrey, size: 22)
                : null,
      ),
    );
  }
}
