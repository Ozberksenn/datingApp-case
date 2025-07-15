import 'package:datingapp/product/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? obscure;
  final void Function()? onTapSuffix;
  final TextEditingController? controller;
  const TextFieldWidget({
    super.key,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.obscure,
    this.onTapSuffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        hintText: labelText,
        prefixIcon:
            prefixIcon != null
                ? Icon(prefixIcon, color: AppColors.lightGrey, size: 22)
                : null,
        suffixIcon:
            suffixIcon != null
                ? IconButton(
                  onPressed: onTapSuffix,
                  icon: Icon(suffixIcon, color: AppColors.lightGrey, size: 22),
                )
                : null,
      ),
    );
  }
}
