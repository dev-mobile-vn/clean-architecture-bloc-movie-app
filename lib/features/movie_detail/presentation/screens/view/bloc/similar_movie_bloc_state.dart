part of 'similar_movie_bloc_cubit.dart';

class SimilarBlocState extends Equatable {
  final BaseMovieStatus status;
  final SimilarMovieData data;

  const SimilarBlocState({required this.status, required this.data});

  factory SimilarBlocState.init() => const SimilarBlocState(status: BaseMovieStatus.init, data: SimilarMovieData());

  SimilarBlocState copyWith({final BaseMovieStatus? status, final SimilarMovieData? data}) => SimilarBlocState(status: status ?? this.status, data: data ?? this.data);

  @override
  List<Object?> get props => [status, data];
}

class SimilarMovieData extends Equatable {
  final List<MovieModel> similarMovies;

  const SimilarMovieData({this.similarMovies = const []});

  @override
  List<Object?> get props => [similarMovies];

  SimilarMovieData copyWith({final List<MovieModel>? similarMovies,}) {
    return SimilarMovieData(similarMovies: similarMovies ?? this.similarMovies);
  }
}
