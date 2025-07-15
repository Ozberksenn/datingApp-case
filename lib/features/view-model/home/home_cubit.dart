import 'dart:convert';

import 'package:datingapp/features/model/movie_model.dart';
import 'package:datingapp/features/view-model/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/services/app_service.dart';
import '../../../product/storage/storage_service.dart';
import '../../model/api_response_model.dart';
import '../../model/user_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
    : super(
        HomeState(
          currentIndex: 0,
          isMovieLoading: true,
          isFavoriteLoading: true,
          isPaginationLoading: false,
          movies: [],
          currentPage: 1,
        ),
      );

  void changeTab(int newIndex) => emit(state.copyWith(currentIndex: newIndex));

  init() async {
    getUser();
    getMovies();
    getFavoriteMovies();
  }

  Future<void> getUser() async {
    ApiResponseModel response = await AppService.instance.getData(
      "/user/profile",
    );
    if (response.isSuccess == true) {
      if ((response.data['data'] as Map<String, dynamic>).isNotEmpty) {
        final user = UserModel.fromJson(response.data['data']);
        await SharedPrefManager.setString('user', jsonEncode(user.toJson()));
      }
    }
  }

  Future<void> getMovies({int? page}) async {
    final int nextPage = page ?? 1;

    if (nextPage == 1) {
      emit(state.copyWith(isMovieLoading: true));
    } else {
      emit(state.copyWith(isPaginationLoading: true));
    }

    ApiResponseModel response = await AppService.instance.getData(
      "/movie/list?page=$page",
    );
    if (response.isSuccess == true) {
      if ((response.data['data']['movies'] as List).isNotEmpty) {
        List<MovieModel> newMovies =
            (response.data['data']['movies'] as List)
                .map((e) => MovieModel.fromJson(e))
                .toList();

        final List<MovieModel> allList =
            nextPage == 1 ? newMovies : [...?state.movies, ...newMovies];

        emit(
          state.copyWith(
            movies: allList,
            isMovieLoading: false,
            isPaginationLoading: false,
            currentPage: nextPage,
          ),
        );
      }
    } else {
      emit(state.copyWith(isMovieLoading: false, isPaginationLoading: false));
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
        emit(
          state.copyWith(
            isFavoriteLoading: false,
            favouriteMovies: favoriteMovies,
          ),
        );
      }
    } else {
      emit(state.copyWith(isFavoriteLoading: false, favouriteMovies: []));
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
