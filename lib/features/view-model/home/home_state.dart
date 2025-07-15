import 'package:datingapp/features/model/movie_model.dart';

class HomeState {
  final int currentIndex;
  final bool isFavoriteLoading;
  final bool isMovieLoading;
  final String? errorMessage;
  List<MovieModel>? movies = [];
  List<MovieModel>? favouriteMovies = [];

  HomeState({
    required this.currentIndex,
    required this.isFavoriteLoading,
    this.movies,
    this.errorMessage,
    this.favouriteMovies,
    required this.isMovieLoading,
  });

  HomeState copyWith({
    int? currentIndex,
    bool? isFavoriteLoading,
    bool? isMovieLoading,
    String? errorMessage,
    List<MovieModel>? movies,
    List<MovieModel>? favouriteMovies,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      isFavoriteLoading: isFavoriteLoading ?? this.isFavoriteLoading,
      isMovieLoading: isMovieLoading ?? this.isMovieLoading,
      errorMessage: errorMessage,
      movies: movies ?? this.movies,
      favouriteMovies: favouriteMovies ?? this.favouriteMovies,
    );
  }
}
