import 'package:movie_app/common/contants/routers.dart';
import 'package:movie_app/config/network_constants.dart';
import 'package:movie_app/core/data/model/movie_model.dart';
import 'package:movie_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../widgets/movies_widget.dart';
import '../widgets/title_widget.dart';

class MainView extends StatelessWidget {
  final List<MovieModel> movies;
  final List<MovieModel> moviesTop;

  const MainView({
    super.key,
    required this.movies,
    required this.moviesTop,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Column(
        children: [
          TitleWidget(
            title: S.of(context).title_top_movie,
            action: () {
              Navigator.pushNamed(context, listMovieRoute, arguments: apiTopRate);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          MoviesWidget(items: moviesTop),
          const SizedBox(
            height: 20,
          ),
          TitleWidget(
            title: S.of(context).title_new_release,
            action: () {
              Navigator.pushNamed(context, listMovieRoute, arguments: apiNowPlaying);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          MoviesWidget(
            items: movies,
          ),
        ],
      ),
    );
  }
}
