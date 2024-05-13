
import 'package:get_it/get_it.dart';

import '../core/data/data_resource/remote/movie/movie_api_service.dart';
import '../core/data/data_resource/remote/movie/search_movie_api_service.dart';
import '../core/network/movie_provider.dart';
import '../core/network/search_movie_provider.dart';
import '../features/main/screens/explore/data/repository/search_movies_repository_impld.dart';
import '../features/main/screens/explore/domain/repository/search_movies_repository.dart';
import '../features/main/screens/explore/domain/use_case/search_use_case.dart';
import '../features/main/screens/explore/presentation/bloc/explore_cubit.dart';
import '../features/main/screens/home/bloc/home_cubit.dart';
import '../features/movie_detail/data/repository/movie_detail_repository_impl.dart';
import '../features/movie_detail/domain/repository/movie_detail_repository.dart';
import '../features/movie_detail/domain/use_case/movie_detai_use_case.dart';
import '../features/movie_detail/domain/use_case/review_use_case.dart';
import '../features/movie_detail/domain/use_case/trailer_use_case.dart';
import '../features/movie_detail/presentation/bloc/movie_detail_bloc_cubit.dart';
import '../features/movie_detail/presentation/screens/view/bloc/similar_movie_bloc_cubit.dart';
import '../features/movies/data/repository/movies_repository_impl.dart';
import '../features/movies/domain/list_movie_use_case/list_movie.dart';
import '../features/movies/domain/repository/movies_repository.dart';
import '../features/movies/presentation/bloc/list_movie_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<MovieProvider>((MovieProvider()));
  sl.registerSingleton<MovieApiService>((MovieApiService(sl.get())));

  sl.registerLazySingleton<SearchMovieProvider>(() => SearchMovieProvider());
  sl.registerLazySingleton<SearchMovieApiService>(
      () => SearchMovieApiService(sl.get()));

  sl.registerSingleton<MovieDetailRepository>(
      MovieDetailRepositoryImpl(sl.get()));
  sl.registerSingleton<MovieDetailUseCase>(MovieDetailUseCase(sl.get()));

  sl.registerSingleton<ListMovieRepository>(ListMovieRepositoryImpl(sl.get()));
  sl.registerSingleton<ListMovieUseCase>(ListMovieUseCase(sl.get()));

  sl.registerSingleton(ListMovieCubit(sl.get()));
  sl.registerSingleton(ReviewUseCase(sl.get()));
  sl.registerSingleton(TrailerUseCase(sl.get()));

  sl.registerSingleton<HomeCubit>(
      HomeCubit(movieDetailUseCase: sl.get(), listMovieUseCase: sl.get()));
  sl.registerFactory(() => MovieDetailBlocCubit(
      detailUseCase: sl.get(),
      listMovieUseCase: sl.get(),
      reviewUseCase: sl.get(),
      trailerUseCase: sl.get()));
  sl.registerFactory<SimilarMovieBlocCubit>(
      () => SimilarMovieBlocCubit(sl.get()));
  sl.registerLazySingleton<SearchMoviesRepository>(
      () => SearchMoviesRepositoryImpl(sl.get()));
  sl.registerLazySingleton<SearchUseCase>(() => SearchUseCase(sl.get()));
  sl.registerLazySingleton<ExploreCubit>(() => ExploreCubit(sl.get()));
}
