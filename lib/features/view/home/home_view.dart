import 'package:datingapp/features/view-model/home/home_cubit.dart';
import 'package:datingapp/features/view/home/widgets/bottom_navigation_bar.dart';
import 'package:datingapp/features/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/discover.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocConsumer<HomeCubit, int>(
        builder: (context, state) {
          final currentIndex = context.watch<HomeCubit>().state;
          return Scaffold(
            body: IndexedStack(
              index: currentIndex,
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
