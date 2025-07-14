import 'package:datingapp/features/view-model/home/home_cubit.dart';
import 'package:datingapp/features/view-model/home/home_state.dart';
import 'package:datingapp/features/view/home/widgets/bottom_navigation_bar.dart';
import 'package:datingapp/features/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/discover.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..getMovies(),
      child: BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          final homeState = context.watch<HomeCubit>().state;
          return Scaffold(
            body: IndexedStack(
              index: homeState.currentIndex,
              children: [
                Discover(movieList: homeState.movies ?? []),
                ProfieView(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBarWidget(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
