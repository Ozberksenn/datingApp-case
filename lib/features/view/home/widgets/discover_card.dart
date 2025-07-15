import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:datingapp/features/widgets/radius.dart';
import 'package:datingapp/product/extension/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../product/constants/app_colors.dart';
import '../../../model/movie_model.dart';
import '../../../view-model/home/home_cubit.dart';
import '../../../widgets/padding.dart';
import 'movie_info_tile.dart';

class DiscoverCard extends StatelessWidget {
  const DiscoverCard({
    super.key,
    required this.index,
    required this.cubit,
    required this.movieList,
  });
  final int index;
  final HomeCubit cubit;
  final List<MovieModel> movieList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.8),
      child: Stack(
        fit: StackFit.expand,
        children: [
          discoverImage(cubit, movieList[index]),
          UnderBlackGradient(),
          MovieCaption(cubit: cubit, movieList: movieList, index: index),
        ],
      ),
    );
  }
}

class MovieCaption extends StatelessWidget {
  const MovieCaption({
    super.key,
    required this.cubit,
    required this.movieList,
    required this.index,
  });

  final HomeCubit cubit;
  final List<MovieModel> movieList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ConstEdgeInsets.padding20(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: DiscoverCardHeart(
              cubit: cubit,
              movieList: movieList,
              index: index,
            ),
          ),
          CustomSizedBox.paddingHeight(heightValue: 24.0),
          MovieInfoTile(movie: movieList[index]),
        ],
      ),
    );
  }
}

class UnderBlackGradient extends StatelessWidget {
  const UnderBlackGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: 200,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, AppColors.black],
          ),
        ),
      ),
    );
  }
}

class DiscoverCardHeart extends StatelessWidget {
  const DiscoverCardHeart({
    super.key,
    required this.cubit,
    required this.movieList,
    required this.index,
  });

  final HomeCubit cubit;
  final List<MovieModel> movieList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => cubit.addFavourite(movieList[index], index),
      child: ClipRRect(
        borderRadius: CustomRadius.radius28,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: ConstEdgeInsets.paddingSymetric(
              horizontalPad: 12.0,
              verticalPad: 26.0,
            ),
            decoration: BoxDecoration(
              color: AppColors.grey.withValues(alpha: 0.5),
              borderRadius: CustomRadius.radius28,
              border: Border.all(width: 1, color: AppColors.lightGrey),
            ),
            child:
                movieList[index].isFavorite == false
                    ? Icon(CupertinoIcons.heart, color: AppColors.white)
                    : Icon(CupertinoIcons.heart_fill, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

Widget discoverImage(HomeCubit cubit, MovieModel movie) {
  final imagePath = cubit.replaceImagePath(movie.poster!);
  if (movie.poster != null && movie.poster != "") {
    return CachedNetworkImage(
      imageUrl: imagePath,
      imageBuilder:
          (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  } else {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/logo/SinFlixLogo.png"),
        ),
      ),
    );
  }
}
