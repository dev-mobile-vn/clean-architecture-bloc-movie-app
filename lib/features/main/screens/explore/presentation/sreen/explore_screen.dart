import 'package:movie_app/common/widgets/item_card.dart';
import 'package:movie_app/common/widgets/loading.dart';
import 'package:movie_app/common/widgets/svg_widget.dart';
import 'package:movie_app/core/bloc/base_movie_status.dart';
import 'package:movie_app/di/dependency_injection.dart';
import 'package:movie_app/features/main/screens/explore/presentation/bloc/explore_cubit.dart';
import 'package:movie_app/features/main/screens/explore/presentation/widgets/filter_search_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final bloc = sl.get<ExploreCubit>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      top: false,
      child: Column(
        children: [
          SearchMovie(
            search: (String value) {
              bloc.searchMovie(value);
            },
          ),
          const SizedBox(
            height: 24,
          ),
          BlocConsumer<ExploreCubit, ExploreState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.status == BaseMovieStatus.loading) {
                return const Center(child: Loading());
              } else if (state.status == BaseMovieStatus.success) {
                return Expanded(
                  child: GridView.builder(
                    key: const PageStorageKey('ExploreStorageKey'),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 4,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return ItemCard(item: state.data.movies[index]);
                    },
                    itemCount: state.data.movies.length,
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

}

class SearchMovie extends StatelessWidget {
  final Function(String text) search;

  const SearchMovie({
    super.key,
    required this.search,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: kToolbarHeight),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 58,
              child: TextFormField(
                onChanged: (String value) {
                  Future.delayed(const Duration(milliseconds: 1000), () {
                    search(value);
                  });
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    fillColor: Colors.red.withOpacity(0.3),
                    hintText: 'Search',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                    prefixIconConstraints: const BoxConstraints(
                        maxHeight: 24,
                        maxWidth: 40,
                        minHeight: 24,
                        minWidth: 40),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset(
                        'assets/icons/ic_search.svg',
                        height: 24,
                        width: 32,
                        color: Colors.red.withOpacity(0.5),
                      ),
                    )),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: () {
              showDialog(context: context, builder: (context) {
                return const FilterSearchMovie();
              });
              // showModalBottomSheet(
              //     context: context,
              //     constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height-120),
              //     builder: (context) {
              //       return const FilterSearchMovie();
              //     });
            },
            child: Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8.0)),
                child: const SvgWidget(
                  ic: 'assets/icons/ic_filter.svg',
                )),
          )
        ],
      ),
    );
  }
}
