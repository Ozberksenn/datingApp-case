import 'package:datingapp/product/constants/app_colors.dart';
import 'package:flutter/material.dart';

class UnderlineTextWidget extends StatelessWidget {
  final String text;
  const UnderlineTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Şifremi Unuttum", style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 4.0),
        Container(width: 120, height: 1.0, color: AppColors.white),
      ],
    );
  }
}
