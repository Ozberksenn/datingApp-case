import 'package:datingapp/features/view/profile/widgets/profile_app_bar.dart';
import 'package:datingapp/features/widgets/radius.dart';
import 'package:datingapp/product/constants/app_colors.dart';
import 'package:datingapp/product/extension/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/padding.dart';

class AddPhotoView extends StatelessWidget {
  const AddPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context, limitedOffer: false),
      body: Column(
        children: [
          CustomSizedBox.paddingHeight(heightValue: 6.0),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Fotoğraflarınızı Yükleyin",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          CustomSizedBox.paddingHeight(heightValue: 6.0),
          Text(
            "Resources out incentivize \n relaxation floor loss cc.",
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          CustomSizedBox.paddingHeight(heightValue: 32.0),
          Container(
            width: context.dynamicWidth(0.50),
            height: context.dynamicHeight(0.23),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: CustomRadius.radius28,
              border: Border.all(width: 1, color: AppColors.lightGrey),
            ),
            child: Center(
              child: Icon(
                CupertinoIcons.plus,
                color: AppColors.lightGrey,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
