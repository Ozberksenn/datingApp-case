import 'package:datingapp/features/view-model/home/home_state.dart';
import 'package:datingapp/features/widgets/padding.dart';
import 'package:flutter/material.dart';
import '../../../product/storage/storage_service.dart';
import 'widgets/movie_card.dart';
import 'widgets/profile_app_bar.dart';
import 'widgets/profile_card.dart';

class ProfieView extends StatelessWidget {
  final HomeState homeState;
  const ProfieView({super.key, required this.homeState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: Padding(
        padding: ConstEdgeInsets.padding4(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileCard(),
            CustomSizedBox.paddingHeight(heightValue: 12.0),
            InkWell(
              // todo : test için remove ettim unutma kaldır.
              onTap: () => SharedPrefManager.remove("user"),
              child: Text(
                "Beğendiğim Filmler",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            CustomSizedBox.paddingHeight(heightValue: 6.0),
            CustomExpanded(
              child: GridView.builder(
                itemCount: homeState.favouriteMovies?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 245,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return homeState.favouriteMovies?[index] != null
                      ? MovieCard(
                        favoriteMovie: homeState.favouriteMovies![index],
                      )
                      : SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
