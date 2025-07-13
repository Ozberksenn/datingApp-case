import 'package:flutter/material.dart';
import '../../../../product/constants/app_fonts.dart';

class MovieInfoTile extends StatelessWidget {
  const MovieInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Günahkar Adam",
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: RichText(
        text: TextSpan(
          text:
              "Community every terroritioest ogpile so ,ast they investigation model.  ",
          style: AppFonts.movieDescriptionText,
          children: [
            TextSpan(
              text: "Daha Fazlası",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
