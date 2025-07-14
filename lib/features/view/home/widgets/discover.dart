import 'package:datingapp/features/model/movie_model.dart';
import 'package:datingapp/features/view-model/home/home_cubit.dart';
import 'package:datingapp/product/extension/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../product/constants/app_colors.dart';
import '../../../widgets/padding.dart';
import 'movie_info_tile.dart';

class Discover extends StatelessWidget {
  final List<MovieModel> movieList;
  const Discover({super.key, required this.movieList});

  @override
  Widget build(BuildContext context) {
    final HomeCubit state = context.read<HomeCubit>();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return Container(
          height: context.dynamicHeight(0.8),
          decoration: conditionImage(state, movieList[index]),
          child: Padding(
            padding: ConstEdgeInsets.padding20(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(CupertinoIcons.heart, color: AppColors.white),
                ),
                CustomSizedBox.paddingHeight(heightValue: 24.0),
                MovieInfoTile(movie: movieList[index]),
              ],
            ),
          ),
        );
      },
    );
  }
}

BoxDecoration conditionImage(HomeCubit state, MovieModel movie) {
  final imagePath = state.replaceImagePath(movie.poster!);
  if (movie.poster != null && movie.poster != "") {
    return BoxDecoration(
      image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(imagePath)),
    );
  } else if (movie.images != [] && movie.images != null) {
    return BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(movie.images![0]),
      ),
    );
  } else {
    return BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/logo/SinFlixLogo.png"),
      ),
    );
  }
}
