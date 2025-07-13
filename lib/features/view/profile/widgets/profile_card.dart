import 'package:datingapp/product/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../product/constants/app_colors.dart';
import '../../../../product/constants/app_fonts.dart';
import '../../../widgets/padding.dart';
import '../../../widgets/radius.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: ConstEdgeInsets.padding0(),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(
              "https://live.staticflickr.com/1820/43259154864_6c2d3b0e94_z.jpg",
            ),
          ),
        ),
      ),
      title: Text("Özberk Şen", style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text("ID:245677", style: AppFonts.greyText),
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
