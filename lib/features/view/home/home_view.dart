import 'package:datingapp/features/view/home/widgets/bottom_navigation_bar.dart';
import 'package:datingapp/features/view/home/widgets/movie_info_tile.dart';
import 'package:datingapp/features/widgets/padding.dart';
import 'package:datingapp/product/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
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
                    MovieInfoTile(),
                  ],
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
