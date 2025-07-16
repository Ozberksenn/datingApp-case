import 'package:flutter/material.dart';
import '../../../widgets/padding.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "Hoşgeldiniz",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        CustomSizedBox.paddingHeight(heightValue: 6.0),
        Text(
          "Tempus varius a vitae interdum id tortor elementum tristique eleifend at.",
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
