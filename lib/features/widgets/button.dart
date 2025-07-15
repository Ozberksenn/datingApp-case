import 'package:flutter/material.dart';
import '../../product/constants/app_colors.dart';
import 'padding.dart';
import 'radius.dart';

class Button extends StatelessWidget {
  final void Function()? onTap;
  final String name;
  const Button({super.key, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: ConstEdgeInsets.padding16(),
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: CustomRadius.radius18,
        ),
        child: Align(alignment: Alignment.center, child: Text(name)),
      ),
    );
  }
}

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ConstEdgeInsets.padding16(),
      decoration: BoxDecoration(
        color: AppColors.grey.withValues(alpha: 0.8),
        borderRadius: CustomRadius.radius18,
      ),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}
