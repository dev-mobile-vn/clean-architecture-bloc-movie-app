part of 'movie_detail_bloc_cubit.dart';

class MovieDetailBlocState extends Equatable {
  final BaseMovieStatus status;
  final MovieDetailData data;

  const MovieDetailBlocState({required this.status, required this.data});

  factory MovieDetailBlocState.init() =>
      const MovieDetailBlocState(status: BaseMovieStatus.init, data: MovieDetailData());

  MovieDetailBlocState copyWith({final BaseMovieStatus? status, final MovieDetailData? data}) =>
      MovieDetailBlocState(status: status ?? this.status, data: data ?? this.data);

  @override
  List<Object?> get props => [status, data];
}

class MovieDetailData extends Equatable {
  final MovieModel? movie;
  final ReviewsResponse? reviews;
  final List<TrailerModel> trailersMovie;
  final List<MovieModel> similarMovies;

  const MovieDetailData({this.movie, this.reviews, this.trailersMovie = const [], this.similarMovies = const []});

  @override
  List<Object?> get props => [movie, reviews, trailersMovie, similarMovies];

  MovieDetailData copyWith({
    final MovieModel? movie,
    final ReviewsResponse? reviews,
    final List<TrailerModel>? trailersMovie,
    final List<MovieModel>? similarMovies,
  }) {
    return MovieDetailData(
        movie: movie ?? this.movie,
        reviews: reviews ?? this.reviews,
        trailersMovie: trailersMovie ?? this.trailersMovie,
        similarMovies: similarMovies ?? this.similarMovies);
  }
}
