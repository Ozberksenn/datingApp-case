import 'package:datingapp/features/widgets/padding.dart';
import 'package:datingapp/product/extension/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../product/constants/app_colors.dart';
import 'radius.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        socialMediaCard(context, FontAwesomeIcons.google),
        socialMediaCard(context, FontAwesomeIcons.apple),
        socialMediaCard(context, FontAwesomeIcons.facebook),
      ],
    );
  }

  Widget socialMediaCard(BuildContext context, IconData icon) {
    return Container(
      width: context.dynamicWidth(0.15),
      height: context.dynamicWidth(0.15),
      margin: ConstEdgeInsets.padding8(),
      decoration: BoxDecoration(
        color: AppColors.grey,
        border: Border.all(width: 1, color: AppColors.lightGrey),
        borderRadius: CustomRadius.radius18,
      ),
      child: Center(child: Icon(icon, color: AppColors.white)),
    );
  }
}
