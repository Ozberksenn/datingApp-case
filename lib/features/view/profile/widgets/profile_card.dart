import 'package:datingapp/product/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../product/constants/app_colors.dart';
import '../../../../product/constants/app_fonts.dart';
import '../../../../product/storage/storage_service.dart';
import '../../../widgets/padding.dart';
import '../../../widgets/radius.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final user = SharedPrefManager.getUser();

    return ListTile(
      contentPadding: ConstEdgeInsets.padding0(),
      leading:
          user!.photoUrl != null && user.photoUrl != ""
              ? Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(user.photoUrl!)),
                ),
              )
              : SizedBox(),
      title: Text(user.name, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text("ID: ${user.id}", style: AppFonts.greyText),
      trailing: addPhotoButton(context),
    );
  }

  InkWell addPhotoButton(BuildContext context) {
    return InkWell(
      onTap: () => context.push(AppRoutes.path(AppRoutes.addPhoto)),
      child: Container(
        padding: ConstEdgeInsets.padding12(),
        decoration: BoxDecoration(
          borderRadius: CustomRadius.radius12,
          color: AppColors.buttonColor,
        ),
        child: Text(
          "Fotoğraf Ekle",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
