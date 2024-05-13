part of 'explore_cubit.dart';

class ExploreState extends Equatable {
  final BaseMovieStatus status;
  final ExploreData data;

  const ExploreState({required this.status, required this.data});

  factory ExploreState.init() => const ExploreState(status: BaseMovieStatus.init, data: ExploreData());

  @override
  List<Object?> get props => [status, data];

  ExploreState copyWith({final BaseMovieStatus? status, final ExploreData? data}) {
    return ExploreState(status: status ?? this.status, data: data ?? this.data);
  }
}

class ExploreData extends Equatable {
  final List<MovieModel> movies;

  const ExploreData({this.movies = const []});

  @override
  List<Object?> get props => [movies];

  ExploreData copyWith({final List<MovieModel>? movies}) =>
      ExploreData(movies: movies ?? this.movies);
}
