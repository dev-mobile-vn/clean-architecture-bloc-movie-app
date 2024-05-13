import 'package:movie_app/core/bloc/base_movie_status.dart';
import 'package:movie_app/core/data/model/movie_model.dart';
import 'package:movie_app/features/movie_detail/data/model/review_model.dart';
import 'package:movie_app/features/movie_detail/data/model/trailer_model.dart';
import 'package:movie_app/features/movie_detail/domain/use_case/movie_detai_use_case.dart';
import 'package:movie_app/features/movie_detail/domain/use_case/review_use_case.dart';
import 'package:movie_app/features/movie_detail/domain/use_case/trailer_use_case.dart';
import 'package:movie_app/features/movies/domain/list_movie_use_case/list_movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'movie_detail_bloc_state.dart';

class MovieDetailBlocCubit extends Cubit<MovieDetailBlocState> {

  MovieDetailBlocCubit(
      {required this.detailUseCase,
      required this.listMovieUseCase,
      required this.reviewUseCase,
      required this.trailerUseCase})
      : super(MovieDetailBlocState.init());

  final MovieDetailUseCase detailUseCase;
  final ListMovieUseCase listMovieUseCase;
  final ReviewUseCase reviewUseCase;
  final TrailerUseCase trailerUseCase;

  void getDetailMovie(String id) async {
    try {
      emit(state.copyWith(status: BaseMovieStatus.loading));
      MovieModel? movie = await detailUseCase(id);
      if (movie != null) {
        emit(state.copyWith(status: BaseMovieStatus.success, data: state.data.copyWith(movie: movie)));
      } else {
        emit(state.copyWith(status: BaseMovieStatus.empty));
      }
    } catch (_) {
      emit(state.copyWith(status: BaseMovieStatus.success));
    }
  }

  void getTrailers(String id) async {
    try {
      TrailerResponse response = await trailerUseCase(id);
      if (response.trailers.isNotEmpty) {
        emit(state.copyWith(
            status: BaseMovieStatus.success, data: state.data.copyWith(trailersMovie: response.trailers)));
      }
    } catch (_) {
      emit(state.copyWith(status: BaseMovieStatus.success));
    }
  }
}
