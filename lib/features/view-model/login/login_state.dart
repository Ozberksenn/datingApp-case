class LoginState {
  final bool isLoading;
  final String? errorMessage;
  final bool? isSuccess;

  LoginState({this.isLoading = false, this.errorMessage, this.isSuccess});

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
