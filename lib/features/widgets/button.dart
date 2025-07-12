import 'package:flutter/material.dart';
import '../../product/constants/app_colors.dart';
import 'padding.dart';
import 'radius.dart';

class Button extends StatelessWidget {
  final String name;
  const Button({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ConstEdgeInsets.padding16(),
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: CustomRadius.radius18,
      ),
      child: Align(alignment: Alignment.center, child: Text(name)),
    );
  }
}
