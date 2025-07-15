import 'package:datingapp/features/view-model/home/home_cubit.dart';
import 'package:datingapp/features/widgets/radius.dart';
import 'package:datingapp/product/extension/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../product/constants/app_colors.dart';
import '../../../widgets/padding.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.watch<HomeCubit>();
    return Container(
      height: context.dynamicHeight(0.14),
      color: AppColors.black,
      width: context.dynamicWidth(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          bottomNavigationItem(
            context,
            title: "Anasayfa",
            icon:
                homeCubit.state.currentIndex == 0
                    ? FontAwesomeIcons.house
                    : CupertinoIcons.house,
            onTap: () => context.read<HomeCubit>().changeTab(0),
            fontStyle:
                homeCubit.state.currentIndex == 0
                    ? Theme.of(context).textTheme.titleSmall
                    : Theme.of(context).textTheme.labelMedium,
          ),
          bottomNavigationItem(
            context,
            title: "Profil",
            icon:
                homeCubit.state.currentIndex == 1
                    ? FontAwesomeIcons.userLarge
                    : FontAwesomeIcons.user,
            onTap: () => context.read<HomeCubit>().changeTab(1),
            fontStyle:
                homeCubit.state.currentIndex == 1
                    ? Theme.of(context).textTheme.titleSmall
                    : Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }

  Widget bottomNavigationItem(
    BuildContext context, {
    required String title,
    IconData? icon,
    void Function()? onTap,
    TextStyle? fontStyle,
  }) {
    return InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: context.dynamicWidth(0.4)),
        child: Container(
          margin: ConstEdgeInsets.padding8(),
          padding: ConstEdgeInsets.padding16(),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.lightGrey),
            borderRadius: CustomRadius.radius28,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.white, size: 22),
              CustomSizedBox.paddingWidth(widthValue: 6.0),
              Text(title, style: fontStyle),
            ],
          ),
        ),
      ),
    );
  }
}
