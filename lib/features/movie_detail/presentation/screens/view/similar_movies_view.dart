import 'package:movie_app/core/bloc/base_movie_status.dart';
import 'package:movie_app/core/data/model/movie_model.dart';
import 'package:movie_app/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/widgets/item_card.dart';
import '../../../../../core/common/widgets/loading.dart';
import 'bloc/similar_movie_bloc_cubit.dart';

class SimilarMoviesView extends StatefulWidget {
  final String id;
  const SimilarMoviesView({super.key, required this.id});

  @override
  State<SimilarMoviesView> createState() => _SimilarMoviesViewState();
}

class _SimilarMoviesViewState extends State<SimilarMoviesView> {
  SimilarMovieBlocCubit cubit = sl.get<SimilarMovieBlocCubit>();
  @override
  void initState() {
    super.initState();
    cubit.getListMovieSimilar(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMovieBlocCubit, SimilarBlocState>(
      bloc: cubit,
      builder: (context, state) {
        if (state.status == BaseMovieStatus.loading) {
          return const Loading();
        } else if (state.status == BaseMovieStatus.success) {
          List<MovieModel> data = state.data.similarMovies;
          return GridView.builder(
            key: const PageStorageKey('ExploreStorageKey'),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, childAspectRatio: 3 / 4, crossAxisSpacing: 8, mainAxisSpacing: 8),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  ItemCard(item: data[index]),
                  if (data[index].voteAverage != null)
                    Container(
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)),
                      height: 20,
                      width: 32,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(12),
                      child: Text(
                        data[index].voteAverage!.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white, fontSize: 10),
                      ),
                    ),
                ],
              );
            },
            itemCount: data.length,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
