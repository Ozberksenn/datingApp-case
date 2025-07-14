class AddPhotoState {
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;
  final String? photourl;

  AddPhotoState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
    this.photourl,
  });

  AddPhotoState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
    String? photourl,
  }) {
    return AddPhotoState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
      photourl: photourl,
    );
  }
}
