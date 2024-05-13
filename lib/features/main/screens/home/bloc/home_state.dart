part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BaseMovieStatus status;
  final HomeStateData? data;

  const HomeState({required this.status, required this.data});

  factory HomeState.init() => const HomeState(status: BaseMovieStatus.init, data: HomeStateData());

  HomeState copyWith({final BaseMovieStatus? status, final HomeStateData? data}) {
    return HomeState(status: status ?? this.status, data: data ?? this.data);
  }

  @override
  List<Object?> get props => [status, data];
}

class HomeStateData extends Equatable {
  final MovieModel? movie;
  final List<MovieModel> topRateMovies;
  final List<MovieModel> newReleaseMovies;

  const HomeStateData({this.movie, this.topRateMovies = const [], this.newReleaseMovies = const []});
  @override
  List<Object?> get props => [movie, topRateMovies, newReleaseMovies];

  HomeStateData copyWith({final MovieModel? movie, final List<MovieModel>? topRateMovies, final List<MovieModel>? newReleaseMovies}) {
    return HomeStateData(
      movie: movie ?? this.movie,
      topRateMovies: topRateMovies ?? this.topRateMovies,
      newReleaseMovies: newReleaseMovies ?? this.newReleaseMovies,
    );
  }
}
