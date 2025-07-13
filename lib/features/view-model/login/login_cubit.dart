import 'package:datingapp/features/view-model/login/login_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void login(String email, String password) async {
    final dio = Dio();
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final response = await dio.post(
      "https://caseapi.servicelabs.tech/user/login",
      data: {"email": "safa@nodelabs.com", "password": "123456"},
    );
    if (response.statusCode == 200) {
      print("success");
    } else {
      print("error");
    }
  }
}
