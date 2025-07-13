import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../product/constants/app_colors.dart';
import '../../../widgets/padding.dart';
import '../../../widgets/radius.dart';

AppBar profileAppBar(BuildContext context, {bool limitedOffer = true}) {
  return AppBar(
    backgroundColor: AppColors.black,
    leading: Icon(CupertinoIcons.left_chevron, color: AppColors.white),
    title: Text("Profil Detayı", style: Theme.of(context).textTheme.bodyMedium),
    actions: [
      limitedOffer == true
          ? Container(
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: CustomRadius.radius28,
            ),
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
          )
          : SizedBox(),
    ],
  );
}
