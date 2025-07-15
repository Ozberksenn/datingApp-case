import 'package:datingapp/product/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../product/constants/app_colors.dart';
import '../../../../product/storage/storage_service.dart';
import '../../../widgets/padding.dart';
import '../../../widgets/radius.dart';
import 'limited_offer_bottom_sheet.dart';

AppBar profileAppBar(
  BuildContext context, {
  bool limitedOffer = true,
  bool? isExit,
}) {
  return AppBar(
    backgroundColor: AppColors.black,
    leading: BackIcon(isExit: isExit),
    title: Text("Profil Detayı", style: Theme.of(context).textTheme.bodyMedium),
    actions: [limitedOffer == true ? LimitedOffer() : SizedBox()],
  );
}

class LimitedOffer extends StatelessWidget {
  const LimitedOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        limitedOfferBottomSheet(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: CustomRadius.radius28,
        ),
        margin: ConstEdgeInsets.padding8(),
        padding: ConstEdgeInsets.padding8(),
        child: Row(
          children: [
            Icon(Icons.diamond, color: AppColors.white),
            CustomSizedBox.paddingWidth(widthValue: 4.0),
            Text(
              "Sınırlı Teklif",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class BackIcon extends StatelessWidget {
  final bool? isExit;
  const BackIcon({super.key, this.isExit});

  @override
  Widget build(BuildContext context) {
    void exitApp() async {
      await SharedPrefManager.remove("user");
      context.go(AppRoutes.path(AppRoutes.login));
    }

    return InkWell(
      onTap: () async {
        if (isExit == true) {
          exitApp();
        } else {
          context.pop();
        }
      },
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
