import 'package:movie_app/core/bloc/base_movie_status.dart';
import 'package:movie_app/core/data/model/movie_model.dart';
import 'package:movie_app/core/data/model/request/query_request.dart';
import 'package:movie_app/core/data/model/response/movie_response.dart';
import 'package:movie_app/features/movies/domain/list_movie_use_case/list_movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/config/network_constants.dart';
part 'similar_movie_bloc_state.dart';

class SimilarMovieBlocCubit extends Cubit<SimilarBlocState> {
  SimilarMovieBlocCubit(this.listMovieUseCase) : super(SimilarBlocState.init());

  final ListMovieUseCase listMovieUseCase;

  void getListMovieSimilar(String id) async {
    try {
      emit(state.copyWith(status: BaseMovieStatus.loading));
      MovieResponse response = await listMovieUseCase(QueryRequest("en_US", 1, apiSimilar, id));
      if (response.movies.isNotEmpty) {
        emit(
            state.copyWith(status: BaseMovieStatus.success, data: state.data.copyWith(similarMovies: response.movies)));
      } else {
        emit(state.copyWith(status: BaseMovieStatus.empty));
      }
    } catch (e) {
      emit(state.copyWith(status: BaseMovieStatus.success));
    }
  }
}
