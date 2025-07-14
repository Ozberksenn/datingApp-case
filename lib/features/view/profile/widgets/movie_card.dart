import 'package:cached_network_image/cached_network_image.dart';
import 'package:datingapp/features/model/movie_model.dart';
import 'package:datingapp/features/view-model/home/home_cubit.dart';
import 'package:datingapp/features/widgets/padding.dart';
import 'package:datingapp/features/widgets/radius.dart';
import 'package:datingapp/product/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCard extends StatelessWidget {
  final MovieModel favoriteMovie;
  const MovieCard({super.key, required this.favoriteMovie});

  @override
  Widget build(BuildContext context) {
    final HomeCubit state = context.read<HomeCubit>();
    final imagePath = state.replaceImagePath(favoriteMovie.poster!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomExpanded(
          child: CachedNetworkImage(
            imageUrl: imagePath,
            imageBuilder:
                (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: CustomRadius.radius12,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Text(
          favoriteMovie.title ?? "",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(favoriteMovie.director ?? "", style: AppFonts.greyText),
      ],
    );
  }
}
