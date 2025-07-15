import 'package:datingapp/features/view-model/add_photo/add_photo_cubit.dart';
import 'package:datingapp/product/extension/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../product/constants/app_colors.dart';
import '../../../../product/storage/storage_service.dart';
import '../../../widgets/radius.dart';

class UploadPhotoCardWidget extends StatelessWidget {
  const UploadPhotoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return UploadPhotoCard();
  }
}

class UploadPhotoCard extends StatelessWidget {
  const UploadPhotoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AddPhotoCubit>();
    final user = SharedPrefManager.getUser();

    return InkWell(
      onTap: () => cubit.selectPhoto(),
      child:
          cubit.state.bytesImage != null
              ? Container(
                width: context.dynamicWidth(0.50),
                height: context.dynamicHeight(0.23),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: MemoryImage(cubit.state.bytesImage!),
                  ),
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
              )
              : Container(
                width: context.dynamicWidth(0.50),
                height: context.dynamicHeight(0.23),
                decoration: BoxDecoration(
                  image:
                      user!.photoUrl != ""
                          ? DecorationImage(image: NetworkImage(user.photoUrl!))
                          : null,
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
    );
  }
}
