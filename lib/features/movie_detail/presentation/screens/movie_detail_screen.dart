import 'package:movie_app/core/bloc/base_movie_status.dart';
import 'package:movie_app/core/data/model/movie_model.dart';
import 'package:movie_app/di/dependency_injection.dart';
import 'package:movie_app/features/movie_detail/data/model/trailer_model.dart';
import 'package:movie_app/features/movie_detail/presentation/bloc/movie_detail_bloc_cubit.dart';
import 'package:movie_app/features/movie_detail/presentation/screens/view/bloc/similar_movie_bloc_cubit.dart';
import 'package:movie_app/features/movie_detail/presentation/screens/view/comment/comment_view.dart';
import 'package:movie_app/features/watch_video/watch_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/common/contants/routers.dart';
import '../../../../core/common/utils/times_utils.dart';
import '../../../../core/common/widgets/image_widget.dart';
import '../../../../core/common/widgets/loading.dart';
import '../../../../core/common/widgets/svg_widget.dart';
import '../../../../core/config/network_constants.dart';
import 'view/similar_movies_view.dart';

class MovieDetailScreen extends StatefulWidget {
  final String id;

  const MovieDetailScreen({super.key, required this.id});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late String id;
  late SimilarMovieBlocCubit similarMovieBlocCubit;
  late MovieDetailBlocCubit cubit;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    _tabController = TabController(
        length: 3,
        vsync: this,
        animationDuration: const Duration(milliseconds: 50));
    cubit = sl.get<MovieDetailBlocCubit>();
    cubit
      ..getDetailMovie(id)
      ..getTrailers(id);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  double _calculateOffset(double offset) {
    if (offset < 0) return 0;
    if (offset > 100) return 1;
    return offset / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<MovieDetailBlocCubit>(
        create: (context) => cubit,
        child: BlocConsumer<MovieDetailBlocCubit, MovieDetailBlocState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.status == BaseMovieStatus.loading) {
              return const Loading();
            }
            MovieDetailData data = state.data;
            return SafeArea(
              top: false,
              child: NestedScrollView(
                  physics: const ClampingScrollPhysics(),
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverStack(children: [
                        SliverToBoxAdapter(
                          child: Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: 428 / 320,
                                child: CacheImageWidget(
                                  imageUrl:
                                      '$baseUrlImage${data.movie?.posterPath}',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SliverLayoutBuilder(builder: (_, size) {
                          return SliverAppBar(
                              pinned: true,
                              elevation: 0,
                              leadingWidth: 46,
                              leading: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: size.scrollOffset > 100
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                              toolbarHeight: 50,
                              backgroundColor: Color.lerp(
                                  Colors.transparent,
                                  Colors.white,
                                  _calculateOffset(size.scrollOffset)));
                        })
                      ]),
                      SliverToBoxAdapter(
                        child: ContentView(
                          movie: data.movie,
                        ),
                      ),
                      SliverPinnedHeader(
                          child: Material(
                        color: Colors.white,
                        child: Stack(
                          children: [
                            const Positioned(
                                left: 0,
                                bottom: -8,
                                right: 0,
                                child: Divider(
                                  thickness: 2,
                                )),
                            Center(
                              child: TabBar(
                                  onTap: (index) {
                                    switch (index) {
                                      case 0:
                                        sl
                                            .get<MovieDetailBlocCubit>()
                                            .getTrailers(id);
                                        break;
                                    }
                                  },
                                  isScrollable: true,
                                  controller: _tabController,
                                  tabs: const [
                                    Tab(
                                      child: Text('Trailers'),
                                    ),
                                    Tab(
                                      child: Text('More Like This'),
                                    ),
                                    Tab(
                                      child: Text('Comments'),
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ))
                    ];
                  },
                  body: TabBarView(
                      controller: _tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        TrailersView(data: data.trailersMovie),
                        SimilarMoviesView(
                          id: id,
                        ),
                        CommentsView(
                          id: id,
                        ),
                      ])),
            );
          },
        ),
      ),
    );
  }
}

class ContentView extends StatelessWidget {
  final MovieModel? movie;

  const ContentView({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                movie?.title ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 20, overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
            ),
            const SvgWidget(
              ic: 'assets/icons/ic_my_list.svg',
            ),
            const SizedBox(
              width: 20,
            ),
            const SvgWidget(
              ic: 'assets/icons/ic_share.svg',
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        SingleChildScrollView(
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              const SvgWidget(ic: 'assets/icons/ic_star.svg'),
              const SizedBox(
                width: 8,
              ),
              Text(
                '${movie?.voteAverage?.toStringAsFixed(1)}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              const SizedBox(
                width: 4,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Theme.of(context).primaryColor,
                size: 14,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(movie?.releaseDate != null
                  ? '${formatDateTime(movie!.releaseDate!)}'
                  : ''),
              const SizedBox(
                width: 16,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1)),
                child: Text(
                  '13+',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14, color: Theme.of(context).primaryColor),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1)),
                child: Text(
                  'United States',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14, color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.red,
                    minimumSize:
                        Size(MediaQuery.sizeOf(context).width * 0.5 - 24, 36)),
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/ic_play.svg'),
                label: Text(
                  'Play',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white),
                )),
            const SizedBox(
              width: 16,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    minimumSize:
                        Size(MediaQuery.sizeOf(context).width * 0.5 - 24, 36),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: const BorderSide(color: Colors.red, width: 2))),
                onPressed: () {},
                icon: const SvgWidget(
                  ic: 'assets/icons/ic_tab_download.svg',
                  color: Colors.red,
                ),
                label: Text(
                  'Download',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.red),
                )),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Genre: Action, Superhero, Science Fiction, Romance, Thriller, ...',
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(overflow: TextOverflow.ellipsis),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            movie?.overview ?? "",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}

class TrailersView extends StatelessWidget {
  final List<TrailerModel> data;

  const TrailersView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            watchVideoRoute,
            arguments: WatchVideoArguments(index: index, data: data),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CacheImageWidget(
                  radius: 4,
                  width: 120,
                  height: 74,
                  fit: BoxFit.fill,
                  imageUrl: YoutubePlayer.getThumbnail(
                    videoId: data[index].key,
                    quality: ThumbnailQuality.high,
                  ),
                ),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data[index].name,
                    maxLines: 2,
                  ),
                ))
              ],
            ),
          ),
        );
      },
      itemCount: data.length,
    );
  }
}
