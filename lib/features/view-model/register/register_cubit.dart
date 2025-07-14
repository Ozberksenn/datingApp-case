import 'package:datingapp/features/view-model/register/register_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  void register(String email, String name, String password) async {
    // todo : app_Service oluştur oradan çek.
    final dio = Dio();
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final response = await dio.post(
      "https://caseapi.servicelabs.tech/user/register",
      data: {"email": email, "name": name, "password": password},
    );
    if (response.statusCode == 200) {
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } else {
      emit(state.copyWith(isLoading: false, isSuccess: false));
    }
  }
}
