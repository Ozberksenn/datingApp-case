import 'package:datingapp/features/view-model/add_photo/add_photo_state.dart';
import 'package:datingapp/product/services/app_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/storage/storage_service.dart';

class AddPhotoCubit extends Cubit<AddPhotoState> {
  AddPhotoCubit() : super(AddPhotoState());

  Future<void> uploadPhoto(formData) async {
    final dio = Dio();
    try {
      final user = SharedPrefManager.getUser();
      final token = user?.token;
      final response = await dio.post(
        '${AppService.baseUrl}/user/upload_photo',
        data: formData,
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
      print('Yükleme hatası: $e');
    }
  }
}
