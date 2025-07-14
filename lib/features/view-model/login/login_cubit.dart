import 'dart:convert';
import 'package:datingapp/features/view-model/login/login_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/storage/storage_service.dart';
import '../../model/user_model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void login(String email, String password) async {
    final dio = Dio();
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final response = await dio.post(
        "https://caseapi.servicelabs.tech/user/login",
        data: {"email": email, "password": password},
        // data: {"email": "safa@nodelabs.com", "password": "123456"},
      );
      if (response.statusCode == 200) {
        if ((response.data['data'] as Map<String, dynamic>).isNotEmpty) {
          final user = UserModel.fromJson(response.data['data']);
          await SharedPrefManager.setString('user', jsonEncode(user.toJson()));
          emit(state.copyWith(isLoading: false, isSuccess: true));
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
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: 'Error',
        ),
      );
    }
  }
}
