class LoginState {
  final bool isLoading;
  final String? errorMessage;
  final bool? isSuccess;
  bool isObscuere;
  final String language;

  LoginState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess,
    this.isObscuere = true,
    this.language = 'TR',
  });

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
    bool? isObscuere,
    String? language,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
      isObscuere: isObscuere ?? this.isObscuere,
      language: language ?? this.language,
    );
  }
}
