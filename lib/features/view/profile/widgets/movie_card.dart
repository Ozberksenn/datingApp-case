import 'package:datingapp/features/widgets/padding.dart';
import 'package:datingapp/product/constants/app_fonts.dart';
import 'package:datingapp/product/extension/context_extension.dart';
import 'package:flutter/material.dart';
import '../../../widgets/radius.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomExpanded(
          child: Container(
            height: context.dynamicHeight(0.2),
            decoration: BoxDecoration(
              borderRadius: CustomRadius.radius12,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://intheposter.com/cdn/shop/files/the-manager-in-the-poster-1.jpg?v=1733910535",
                ),
              ),
            ),
          ),
        ),
        Text("Gece Karanlık", style: Theme.of(context).textTheme.titleSmall),
        Text("Fox Studios", style: AppFonts.greyText),
      ],
    );
  }
}
