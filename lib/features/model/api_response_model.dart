class ApiResponseModel<T> {
  final dynamic data;
  final String? errorMessage;
  final int? statusCode;
  final bool isSuccess;

  ApiResponseModel({
    this.data,
    this.errorMessage,
    this.statusCode,
    required this.isSuccess,
  });
}
