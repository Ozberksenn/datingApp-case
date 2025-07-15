import 'package:datingapp/features/view-model/home/home_cubit.dart';
import 'package:datingapp/features/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'discover_card.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final cubit = context.read<HomeCubit>();
      final state = cubit.state;

      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !state.isPaginationLoading) {
        cubit.getMovies(page: state.currentPage + 1);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeCubit cubit = context.watch<HomeCubit>();
    final state = cubit.state;
    final movies = state.movies ?? [];
    if (state.isMovieLoading) {
      return LoadingWidget();
    }
    return ListView.builder(
      controller: _scrollController,
      itemCount: movies.length + (state.isPaginationLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < movies.length) {
          return DiscoverCard(cubit: cubit, movieList: movies, index: index);
        } else {
          return LoadingWidget();
        }
      },
    );
  }
}
