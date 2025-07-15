class LoginState {
  final bool isLoading;
  final String? errorMessage;
  final bool? isSuccess;
  bool isObscuere;

  LoginState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess,
    this.isObscuere = true,
  });

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
    bool? isObscuere,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
      isObscuere: isObscuere ?? this.isObscuere,
    );
  }
}
