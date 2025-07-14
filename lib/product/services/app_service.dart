import 'package:datingapp/product/storage/storage_service.dart';
import 'package:dio/dio.dart';

import '../../features/model/api_response_model.dart';

class AppService {
  static const baseUrl = "https://caseapi.servicelabs.tech";

  late final Dio dio;

  AppService._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final user = SharedPrefManager.getUser();
          final token = user?.token;
          if (token != "" && token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
      ),
    );
  }

  static final AppService _instance = AppService._init();

  static AppService get instance => _instance;

  Future<ApiResponseModel> getData(
    String path,
    Function(dynamic data) fromJson,
  ) async {
    try {
      final response = await dio.get(path);
      return ApiResponseModel(
        data: fromJson(response.data),
        isSuccess: true,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      return ApiResponseModel(
        isSuccess: false,
        statusCode: e.response?.statusCode,
        errorMessage: e.message,
      );
    }
  }

  Future<ApiResponseModel> postData(
    String path,
    Map<String, dynamic> parameters,
  ) async {
    try {
      final response = await dio.post(path, data: parameters);
      return ApiResponseModel(
        data: response.data,
        isSuccess: true,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      return ApiResponseModel(
        isSuccess: false,
        statusCode: e.response?.statusCode,
        errorMessage: e.message,
      );
    }
  }
}
