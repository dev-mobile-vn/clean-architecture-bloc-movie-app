import 'package:movie_app/core/data/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common/widgets/image_widget.dart';

class BannerView extends StatelessWidget {
  final MovieModel movie;

  const BannerView({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CacheImageWidget(
          imageUrl: 'http://image.tmdb.org/t/p/w500${movie.posterPath}',
          fit: BoxFit.fitWidth,
          width: MediaQuery.sizeOf(context).width,
          height: 350,
        ),
        Positioned(
          top: 56,
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              SvgPicture.asset(
                'assets/icons/ic_logo.svg',
                height: 24,
                width: 24,
              ),
              const Spacer(),
              SvgPicture.asset('assets/icons/ic_search.svg'),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset('assets/icons/ic_notification.svg'),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 24,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title ?? "",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                ),
                Text(
                  movie.originalTitle ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(24)),
                      height: 32,
                      width: 83,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset('assets/icons/ic_play.svg'),
                          const SizedBox(
                            width: 8,
                          ),
                          Text('Play',
                              style:
                                  Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white, fontSize: 12))
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.white, width: 2)),
                      height: 32,
                      width: 83,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text('My List', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ))
      ],
    );
  }
}
