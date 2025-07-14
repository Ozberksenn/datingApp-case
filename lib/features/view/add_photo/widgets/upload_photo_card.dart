import 'package:datingapp/features/view-model/add_photo/add_photo_cubit.dart';
import 'package:datingapp/product/extension/context_extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../product/constants/app_colors.dart';
import '../../../../product/storage/storage_service.dart';
import '../../../view-model/add_photo/add_photo_state.dart';
import '../../../widgets/radius.dart';
import 'package:http_parser/http_parser.dart';

class UploadPhotoCardWidget extends StatelessWidget {
  const UploadPhotoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddPhotoCubit(),
      child: BlocConsumer<AddPhotoCubit, AddPhotoState>(
        builder: (context, state) {
          return UploadPhotoCard();
        },
        listener: (context, state) {},
      ),
    );
  }
}

class UploadPhotoCard extends StatelessWidget {
  const UploadPhotoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AddPhotoCubit>();
    final user = SharedPrefManager.getUser();

    void selectPhoto() async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          image!.path,
          filename: image.path.split('/').last,
          contentType: MediaType('image', 'jpeg'),
        ),
      });
      state.uploadPhoto(formData);
    }

    return InkWell(
      onTap: () => selectPhoto(),
      child: Container(
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
