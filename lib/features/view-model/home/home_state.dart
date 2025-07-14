import 'package:datingapp/features/model/movie_model.dart';

class HomeState {
  final int currentIndex;
  final bool isLoading;
  final String? errorMessage;
  List<MovieModel>? movies = [];

  HomeState({
    required this.currentIndex,
    required this.isLoading,
    this.movies,
    this.errorMessage,
  });

  HomeState copyWith({
    int? currentIndex,
    bool? isLoading,
    String? errorMessage,
    List<MovieModel>? movies,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      movies: movies ?? this.movies,
    );
  }
}
