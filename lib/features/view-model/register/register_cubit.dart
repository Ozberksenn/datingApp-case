import 'package:datingapp/features/view-model/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/services/app_service.dart';
import '../../model/api_response_model.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  void register(String email, String name, String password) async {
    ApiResponseModel response = await AppService.instance.postData(
      "/user/register",
      {"email": email, "name": name, "password": password},
    );
    if (response.statusCode == 200) {
      if ((response.data['data'] as Map<String, dynamic>).isNotEmpty) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      }
    } else {
      emit(
        state.copyWith(isLoading: false, isSuccess: false, errorMessage: ''),
      );
    }
  }
}
