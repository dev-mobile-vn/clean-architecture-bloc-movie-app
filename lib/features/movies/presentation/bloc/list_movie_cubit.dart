import 'package:movie_app/core/bloc/base_movie_status.dart';
import 'package:movie_app/core/data/model/movie_model.dart';
import 'package:movie_app/core/data/model/request/query_request.dart';
import 'package:movie_app/core/data/model/response/movie_response.dart';
import 'package:movie_app/features/movies/domain/list_movie_use_case/list_movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'list_movie_state.dart';

class ListMovieCubit extends Cubit<ListMovieState> {
  final ListMovieUseCase movieUseCase;
  ListMovieCubit(this.movieUseCase) : super(ListMovieState.init());
  List<MovieModel> listMovie = List.empty(growable: true);
  void onGetListMovie(String path) async {
    try {
      emit(state.copyWith(status: BaseMovieStatus.loading));
      MovieResponse response = await movieUseCase(QueryRequest("en_US", 1, path));
      if (response.movies.isNotEmpty) {
        listMovie = response.movies;
        emit(state.copyWith(
            status: BaseMovieStatus.success,
            data: ListMovieData(page: response.page, totalPages: response.totalPages, movies: response.movies)));
      } else {
        emit(state.copyWith(status: BaseMovieStatus.empty));
      }
    } catch (_) {
      emit(state.copyWith(status: BaseMovieStatus.success));
    }
  }

  int page = 1;
  void onGetListMovieLoadMore(String path) async {
    try {
      emit(state.copyWith(status: BaseMovieStatus.loadMore));
      MovieResponse response = await movieUseCase(QueryRequest("en_US", page++, path));
      if (response.movies.isNotEmpty) {
        listMovie.addAll(response.movies);
        emit(state.copyWith(
            status: BaseMovieStatus.success,
            data: ListMovieData(page: response.page, totalPages: response.totalPages, movies: listMovie)));
      } else {
        emit(state.copyWith(status: BaseMovieStatus.empty));
      }
    } catch (_) {
      emit(state.copyWith(status: BaseMovieStatus.success));
    }
  }
}
