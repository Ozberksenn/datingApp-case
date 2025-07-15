import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../product/constants/app_colors.dart';
import '../../../widgets/padding.dart';
import '../../../widgets/radius.dart';

AppBar profileAppBar(BuildContext context, {bool limitedOffer = true}) {
  return AppBar(
    backgroundColor: AppColors.black,
    leading: BackIcon(),
    title: Text("Profil Detayı", style: Theme.of(context).textTheme.bodyMedium),
    actions: [limitedOffer == true ? LimitedOffer() : SizedBox()],
  );
}

class LimitedOffer extends StatelessWidget {
  const LimitedOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: CustomRadius.radius28,
      ),
      padding: ConstEdgeInsets.padding8(),
      child: Row(
        children: [
          Icon(Icons.diamond, color: AppColors.white),
          CustomSizedBox.paddingWidth(widthValue: 4.0),
          Text("Sınırlı Teklif", style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pop(),
      child: Container(
        margin: ConstEdgeInsets.padding6(),
        decoration: BoxDecoration(
          color: AppColors.grey,
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: AppColors.lightGrey),
        ),
        child: Icon(Icons.arrow_back, color: AppColors.white, size: 20),
      ),
    );
  }
}
