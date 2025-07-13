import 'package:datingapp/features/view/home/widgets/bottom_navigation_bar.dart';
import 'package:datingapp/features/widgets/padding.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomExpanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://images.pexels.com/photos/11624930/pexels-photo-11624930.jpeg",
                  ),
                ),
              ),
            ),
          ),
          // Image.network(
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
