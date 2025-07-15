import 'dart:convert';
import 'package:datingapp/features/model/api_response_model.dart';
import 'package:datingapp/features/view-model/login/login_state.dart';
import 'package:datingapp/product/services/app_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/storage/storage_service.dart';
import '../../model/user_model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: null));
    ApiResponseModel response = await AppService.instance.postData(
      "/user/login",
      {"email": email, "password": password},
    );
    if (response.isSuccess == true) {
      if ((response.data['data'] as Map<String, dynamic>).isNotEmpty) {
        final user = UserModel.fromJson(response.data['data']);
        await SharedPrefManager.setString('user', jsonEncode(user.toJson()));
        emit(
          state.copyWith(isLoading: false, isSuccess: true, errorMessage: null),
        );
      }
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: 'E-mail veya şifre hatalı.',
        ),
      );
    }
  }
}
