import 'dart:ui';
import 'package:datingapp/features/widgets/button.dart';
import 'package:datingapp/features/widgets/padding.dart';
import 'package:datingapp/product/extension/context_extension.dart';
import 'package:flutter/material.dart';
import '../../../../product/constants/app_colors.dart';
import '../../../widgets/radius.dart';

Future<dynamic> limitedOfferBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    barrierColor: AppColors.black.withValues(alpha: 0.2),
    isScrollControlled: true,
    backgroundColor: AppColors.grey,
    shape: RoundedRectangleBorder(borderRadius: CustomRadius.radius32),
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          padding: ConstEdgeInsets.padding20(),
          decoration: BoxDecoration(
            borderRadius: CustomRadius.radius32,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              colors: [
                const Color.fromARGB(255, 65, 7, 3),
                AppColors.black,
                const Color.fromARGB(255, 65, 7, 3),
              ],
            ),
          ),
          height: context.dynamicHeight(0.75),
          child: Column(
            children: [
              CustomSizedBox.paddingHeight(heightValue: 8.0),
              Text(
                "Sınırlı Teklif",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              CustomSizedBox.paddingHeight(heightValue: 8.0),
              Text(
                "Jeton paketini seçerek bonus \n kazanın ve yeni bölümlerin kilidini açın",
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              CustomSizedBox.paddingHeight(heightValue: 16.0),
              getBonusCard(context),
              CustomSizedBox.paddingHeight(heightValue: 16.0),
              Text(
                "Kilidi açmak için bir jeton paketi seçin",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              CustomSizedBox.paddingHeight(heightValue: 16.0),
              packagesWidget(context),
              Spacer(),
              Button(name: "Tüm Jetonları Gör"),
              CustomSizedBox.paddingHeight(heightValue: 16.0),
            ],
          ),
        ),
      );
    },
  );
}

Widget packagesWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      packageCard(
        context,
        lineThrough: "200",
        title: "330",
        price: "99,99",
        percent: "10",
      ),
      packageCard(
        context,
        lineThrough: "2000",
        title: "3.375",
        price: "799,99",
        gradientColor: AppColors.blue,
        gradientColor2: Colors.purple,
        percent: "70",
      ),
      packageCard(
        context,
        lineThrough: "1000",
        title: "350",
        price: "399,99",
        percent: "35",
      ),
    ],
  );
}

Widget packageCard(
  BuildContext context, {
  String? lineThrough,
  String? title,
  String? price,
  String? percent = "",
  Color? gradientColor,
  Color? gradientColor2,
}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: context.dynamicHeight(0.22),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 2.0,
            center: Alignment.topLeft,
            tileMode: TileMode.clamp,
            colors: [
              gradientColor ?? AppColors.black,
              gradientColor2 ?? AppColors.darkRed,
              AppColors.buttonColor,
            ],
          ),
          color: AppColors.darkRed,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.6),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
          border: Border.all(width: 1, color: AppColors.lightGrey),
          borderRadius: CustomRadius.radius18,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            Column(
              children: [
                Text(
                  lineThrough ?? "",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  title ?? "",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text("Jeton", style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 75,
                  child: Divider(
                    height: 1,
                    color: AppColors.white,
                    thickness: 0.1,
                  ),
                ),
                CustomSizedBox.paddingHeight(heightValue: 12.0),
                Text(
                  price ?? "",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Padding(
                  padding: ConstEdgeInsets.paddingSymetric(
                    verticalPad: 6.0,
                    horizontalPad: 8.0,
                  ),
                  child: Text(
                    "Başına Haftalık",
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(fontSize: 10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        top: -8,
        left: 30,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: CustomRadius.radius20,
            border: Border.all(width: 1, color: AppColors.lightGrey),
            color: gradientColor ?? AppColors.darkRed,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.6),
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ],
          ),
          width: 50,
          height: 20,
          child: Center(
            child: Text(
              "+$percent%",
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(fontSize: 12),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget getBonusCard(BuildContext context) {
  Widget bonusIcon(BuildContext context, {String? text, String? icon}) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          padding: ConstEdgeInsets.padding8(),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: AppColors.lightGrey),
            color: AppColors.darkRed,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.6),
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Center(child: icon != null ? Image.asset(icon) : null),
        ),
        CustomSizedBox.paddingHeight(heightValue: 10.0),
        SizedBox(
          width: 80,
          child: Text(
            text ?? "",
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  return ClipRRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        padding: ConstEdgeInsets.padding8(),
        width: context.dynamicWidth(1),
        decoration: BoxDecoration(
          borderRadius: CustomRadius.radius28,
          border: Border.all(width: 1, color: AppColors.lightGrey),
          color: AppColors.lightGrey.withValues(alpha: 0.1),
        ),
        child: Column(
          children: [
            CustomSizedBox.paddingHeight(heightValue: 12.0),
            Text(
              "Alacağınız Bonuslar",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            CustomSizedBox.paddingHeight(heightValue: 22.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bonusIcon(
                  context,
                  text: "Premium Hesap",
                  icon: "assets/images/limited-offer/diamond.png",
                ),
                bonusIcon(
                  context,
                  text: "Daha Fazla Eşleşme",
                  icon: "assets/images/limited-offer/double-heart.png",
                ),
                bonusIcon(
                  context,
                  text: "Öne Çıkarma",
                  icon: "assets/images/limited-offer/arrow.png",
                ),
                bonusIcon(
                  context,
                  text: "Daha Fazla Beğeni",
                  icon: "assets/images/limited-offer/heart.png",
                ),
              ],
            ),
            CustomSizedBox.paddingHeight(heightValue: 12.0),
          ],
        ),
      ),
    ),
  );
}
