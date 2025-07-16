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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..init(),
      child: BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: state.currentIndex,
              children: [Discover(), ProfieView()],
            ),
            bottomNavigationBar: BottomNavigationBarWidget(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
