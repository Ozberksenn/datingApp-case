import 'package:datingapp/features/widgets/radius.dart';
import 'package:datingapp/product/extension/context_extension.dart';
import 'package:flutter/cupertino.dart';
import '../../../../product/constants/app_colors.dart';
import '../../../widgets/padding.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.black,
      width: context.dynamicWidth(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          bottomNavigationItem(context, title: "Anasayfa"),
          bottomNavigationItem(
            context,
            title: "Profil",
            icon: CupertinoIcons.person,
          ),
        ],
      ),
    );
  }

  Widget bottomNavigationItem(
    BuildContext context, {
    required String title,
    IconData? icon,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: context.dynamicWidth(0.4)),
      child: Container(
        margin: ConstEdgeInsets.padding8(),
        padding: ConstEdgeInsets.padding16(),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.lightGrey),
          borderRadius: CustomRadius.radius20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon ?? CupertinoIcons.home, color: AppColors.white),
            CustomSizedBox.paddingWidth(widthValue: 4.0),
            Text(title),
          ],
        ),
      ),
    );
  }
}
