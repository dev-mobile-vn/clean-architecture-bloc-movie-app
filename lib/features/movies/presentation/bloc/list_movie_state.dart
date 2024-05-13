part of 'list_movie_cubit.dart';

class ListMovieState extends Equatable {
  final BaseMovieStatus status;
  final ListMovieData data;

  const ListMovieState({required this.status, required this.data});

  factory ListMovieState.init() => const ListMovieState(status: BaseMovieStatus.init, data: ListMovieData());

  @override
  List<Object?> get props => [status, data];

  ListMovieState copyWith({final BaseMovieStatus? status, final ListMovieData? data}) =>
      ListMovieState(status: status ?? this.status, data: data ?? this.data);
}

class ListMovieData extends Equatable {
  final int page;
  final int totalPages;
  final List<MovieModel> movies;

  const ListMovieData({
    this.page = 1,
    this.totalPages = 0,
    this.movies = const [],
  });

  @override
  List<Object?> get props => [page, totalPages, movies];

  ListMovieData copyWith({final int? page, final int? totalPages, final List<MovieModel>? movies}) => ListMovieData(
        page: page ?? this.page,
        totalPages: totalPages ?? this.totalPages,
        movies: movies ?? this.movies,
      );
}
