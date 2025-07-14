import 'package:datingapp/features/model/movie_model.dart';

class HomeState {
  final int currentIndex;
  final bool isLoading;
  final String? errorMessage;
  List<MovieModel>? movies = [];
  List<MovieModel>? favouriteMovies = [];

  HomeState({
    required this.currentIndex,
    required this.isLoading,
    this.movies,
    this.errorMessage,
    this.favouriteMovies,
  });

  HomeState copyWith({
    int? currentIndex,
    bool? isLoading,
    String? errorMessage,
    List<MovieModel>? movies,
    List<MovieModel>? favouriteMovies,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      movies: movies ?? this.movies,
      favouriteMovies: favouriteMovies ?? this.favouriteMovies,
    );
  }
}
