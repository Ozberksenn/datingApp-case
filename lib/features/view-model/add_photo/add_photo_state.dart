import 'dart:typed_data';
import 'package:dio/dio.dart';

class AddPhotoState {
  final bool isLoading;
  final bool isSuccess;
  FormData? photo;
  Uint8List? bytesImage;

  AddPhotoState({
    this.isLoading = false,
    this.isSuccess = false,
    this.photo,
    this.bytesImage,
  });

  AddPhotoState copyWith({
    bool? isLoading,
    bool? isSuccess,
    FormData? photo,
    Uint8List? bytesImage,
  }) {
    return AddPhotoState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      photo: photo ?? this.photo,
      bytesImage: bytesImage,
    );
  }
}
