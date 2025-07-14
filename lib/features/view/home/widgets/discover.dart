import 'package:flutter/cupertino.dart';
import '../../../../product/constants/app_colors.dart';
import '../../../widgets/padding.dart';
import 'movie_info_tile.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
