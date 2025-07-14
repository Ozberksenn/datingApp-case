import 'package:datingapp/features/model/movie_model.dart';
import 'package:datingapp/features/view-model/home/home_state.dart';
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
}
