import 'package:datingapp/features/model/movie_model.dart';

class HomeState {
  final int currentIndex;
  final bool isFavoriteLoading;
  final bool isMovieLoading;
  List<MovieModel>? movies = [];
  List<MovieModel>? favouriteMovies = [];
  final bool isPaginationLoading;
  final int currentPage;

  HomeState({
    required this.currentIndex,
    required this.isFavoriteLoading,
    this.movies,
    this.favouriteMovies,
    required this.isMovieLoading,
    required this.isPaginationLoading,
    required this.currentPage,
  });

  HomeState copyWith({
    int? currentIndex,
    bool? isFavoriteLoading,
    bool? isMovieLoading,
    String? errorMessage,
    List<MovieModel>? movies,
    List<MovieModel>? favouriteMovies,
    bool? isPaginationLoading,
    int? currentPage,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      isFavoriteLoading: isFavoriteLoading ?? this.isFavoriteLoading,
      isMovieLoading: isMovieLoading ?? this.isMovieLoading,
      movies: movies ?? this.movies,
      favouriteMovies: favouriteMovies ?? this.favouriteMovies,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
