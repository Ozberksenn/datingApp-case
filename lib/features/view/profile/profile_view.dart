import 'package:datingapp/features/widgets/padding.dart';
import 'package:flutter/material.dart';
import 'widgets/movie_card.dart';
import 'widgets/profile_app_bar.dart';
import 'widgets/profile_card.dart';

class ProfieView extends StatelessWidget {
  const ProfieView({super.key});

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
            Text(
              "Beğendiğim Filmler",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            CustomSizedBox.paddingHeight(heightValue: 6.0),
            CustomExpanded(
              child: GridView.builder(
                itemCount: 12,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 245,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return MovieCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
