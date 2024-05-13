import 'package:movie_app/common/widgets/loading.dart';
import 'package:movie_app/core/bloc/base_movie_status.dart';
import 'package:movie_app/di/dependency_injection.dart';
import 'package:movie_app/features/main/screens/home/view/banner_view.dart';
import 'package:movie_app/features/main/screens/home/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    sl.get<HomeCubit>()
      ..getMovieDetail('696374')
      ..getTopRateMovies()
      ..getNewReleaseMovies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      top: false,
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == BaseMovieStatus.loading) {
            return const Loading();
          } else if (state.status == BaseMovieStatus.success) {
            return SingleChildScrollView(
              key: const PageStorageKey('HomeStorageKey'),
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                children: [
                  (state.data?.movie != null)
                      ? BannerView(
                          movie: state.data!.movie!,
                        )
                      : const SizedBox(),
                  MainView(
                    movies: state.data!.newReleaseMovies,
                    moviesTop: state.data!.topRateMovies,
                  ),
                ],
              ),
            );
          }
          return const Text('Error');
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
