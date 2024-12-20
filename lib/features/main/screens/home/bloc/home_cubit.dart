import 'package:movie_app/core/bloc/base_movie_status.dart';
import 'package:movie_app/core/data/model/movie_model.dart';
import 'package:movie_app/core/data/model/request/query_request.dart';
import 'package:movie_app/core/data/model/response/movie_response.dart';
import 'package:movie_app/features/movie_detail/domain/use_case/movie_detai_use_case.dart';
import 'package:movie_app/features/movies/domain/list_movie_use_case/list_movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/network_constants.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.movieDetailUseCase, required this.listMovieUseCase}) : super(HomeState.init());

  final MovieDetailUseCase movieDetailUseCase;
  final ListMovieUseCase listMovieUseCase;

  void getMovieDetail(String id) async {
    try {
      emit(state.copyWith(status: BaseMovieStatus.loading, data: const HomeStateData()));
      MovieModel? data = await movieDetailUseCase(id);
      if (data != null) {
        emit(state.copyWith(status: BaseMovieStatus.success, data: state.data!.copyWith(movie: data)));
      } else {
        emit(state.copyWith(status: BaseMovieStatus.empty));
      }
    } catch (_) {
      emit(state.copyWith(status: BaseMovieStatus.error));
    }
  }
  
  void getTopRateMovies() async {
    try {
      emit(state.copyWith(status: BaseMovieStatus.loading, data: const HomeStateData()));
      MovieResponse data = await listMovieUseCase(QueryRequest('en_US', 1, apiTopRate));
      if (data.movies.isNotEmpty) {
        emit(state.copyWith(status: BaseMovieStatus.success, data: state.data!.copyWith(topRateMovies: data.movies)));
      } else {
        emit(state.copyWith(status: BaseMovieStatus.empty));
      }
    } catch (_) {
      emit(state.copyWith(status: BaseMovieStatus.error));
    }
  }

  void getNewReleaseMovies() async {
    try {
      emit(state.copyWith(status: BaseMovieStatus.loading, data: const HomeStateData()));
      MovieResponse data = await listMovieUseCase(QueryRequest('en_US', 1, apiNowPlaying));
      if (data.movies.isNotEmpty) {
        emit(state.copyWith(status: BaseMovieStatus.success, data: state.data!.copyWith(newReleaseMovies: data.movies)));
      } else {
        emit(state.copyWith(status: BaseMovieStatus.empty));
      }
    } catch (_) {
      emit(state.copyWith(status: BaseMovieStatus.error));
    }
  }
}
