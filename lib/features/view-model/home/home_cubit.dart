import 'package:datingapp/features/model/movie_model.dart';
import 'package:datingapp/features/view-model/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/services/app_service.dart';
import '../../model/api_response_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
    : super(
        HomeState(
          currentIndex: 0,
          isLoading: false,
          movies: [],
          errorMessage: null,
        ),
      );

  void changeTab(int newIndex) => emit(state.copyWith(currentIndex: newIndex));

  init() {
    getMovies();
    getFavoriteMovies();
  }

  Future<void> getMovies() async {
    ApiResponseModel response = await AppService.instance.getData(
      "/movie/list?page=1",
    );
    if (response.isSuccess == true) {
      if ((response.data['data']['movies'] as List).isNotEmpty) {
        List<MovieModel> movies =
            (response.data['data']['movies'] as List)
                .map((e) => MovieModel.fromJson(e))
                .toList();
        emit(state.copyWith(isLoading: true, movies: movies));
      }
    } else {
      emit(state.copyWith(isLoading: false, movies: []));
    }
  }

  Future<void> getFavoriteMovies() async {
    ApiResponseModel response = await AppService.instance.getData(
      "/movie/favorites",
    );
    if (response.isSuccess == true) {
      if ((response.data['data'] as List).isNotEmpty) {
        List<MovieModel> favoriteMovies =
            (response.data['data'] as List)
                .map((e) => MovieModel.fromJson(e))
                .toList();
        emit(state.copyWith(isLoading: true, favouriteMovies: favoriteMovies));
      }
    } else {
      emit(state.copyWith(isLoading: false, favouriteMovies: []));
    }
  }

  Future<void> addFavourite(MovieModel movie, int index) async {
    final updatedMovie = movie.copyWith(
      isFavorite: !(movie.isFavorite ?? false),
    );

    final updatedMovies = List<MovieModel>.from(state.movies ?? []);
    updatedMovies[index] = updatedMovie;

    final updatedFavourites = List<MovieModel>.from(
      state.favouriteMovies ?? [],
    );
    if (updatedMovie.isFavorite == true) {
      updatedFavourites.add(updatedMovie);
      ApiResponseModel response = await AppService.instance.postData(
        "/movie/favorite/${movie.id}",
        {},
      );
      if (response.isSuccess == true) {
        debugPrint("Favorilere eklendi");
      }
    } else {
      updatedFavourites.removeWhere((m) => m.id == updatedMovie.id);
    }

    emit(
      state.copyWith(movies: updatedMovies, favouriteMovies: updatedFavourites),
    );
  }

  String replaceImagePath(String path) {
    String imagePath = "";
    if (path.contains("https")) {
      imagePath = path;
    } else if (path.contains("http")) {
      imagePath = path.replaceAll("http", "https");
    }
    return imagePath;
  }
}
