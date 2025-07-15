import 'package:datingapp/features/view-model/add_photo/add_photo_state.dart';
import 'package:datingapp/product/services/app_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../product/storage/storage_service.dart';
import 'package:http_parser/http_parser.dart';

class AddPhotoCubit extends Cubit<AddPhotoState> {
  AddPhotoCubit() : super(AddPhotoState());

  Future<void> selectPhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        image!.path,
        filename: image.path.split('/').last,
        contentType: MediaType('image', 'jpeg'),
      ),
    });
    final bytes = await image.readAsBytes(); // bu şekilde byte dizisini alırsın
    emit(state.copyWith(bytesImage: bytes, photo: formData));
  }

  Future<void> uploadPhoto() async {
    if (state.photo == null) {
      return;
    }
    final dio = Dio();
    try {
      final user = SharedPrefManager.getUser();
      final token = user?.token;
      final response = await dio.post(
        '${AppService.baseUrl}/user/upload_photo',
        data: state.photo,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        emit(state.copyWith(isSuccess: true, isLoading: false));
      } else {
        emit(state.copyWith(isSuccess: false, isLoading: false));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
