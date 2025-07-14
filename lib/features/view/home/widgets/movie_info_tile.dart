import 'package:datingapp/features/model/movie_model.dart';
import 'package:datingapp/features/widgets/padding.dart';
import 'package:datingapp/product/extension/context_extension.dart';
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
      subtitle: SizedBox(
        width: context.dynamicWidth(0.8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomExpanded(
              child: Text(
                movie.plot ?? "",
                style: AppFonts.movieDescriptionText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text("Daha Fazlası", style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}
