import 'package:datingapp/features/model/movie_model.dart';
import 'package:flutter/material.dart';
import '../../../../product/constants/app_fonts.dart';

class MovieInfoTile extends StatelessWidget {
  final MovieModel movie;
  const MovieInfoTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        movie.title ?? "",
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
