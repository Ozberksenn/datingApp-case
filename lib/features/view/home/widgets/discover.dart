import 'package:datingapp/features/model/movie_model.dart';
import 'package:datingapp/features/view-model/home/home_cubit.dart';
import 'package:datingapp/features/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'discover_card.dart';

class Discover extends StatelessWidget {
  final List<MovieModel> movieList;
  const Discover({super.key, required this.movieList});

  @override
  Widget build(BuildContext context) {
    final HomeCubit cubit = context.watch<HomeCubit>();
    return cubit.state.isMovieLoading == false
        ? ListView.builder(
          shrinkWrap: true,
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            return DiscoverCard(
              cubit: cubit,
              movieList: movieList,
              index: index,
            );
          },
        )
        : LoadingWidget();
  }
}
