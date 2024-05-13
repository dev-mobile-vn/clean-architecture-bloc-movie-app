import 'package:movie_app/common/contants/routers.dart';
import 'package:movie_app/common/widgets/image_widget.dart';
import 'package:movie_app/config/network_constants.dart';
import 'package:movie_app/core/data/model/movie_model.dart';
import 'package:flutter/material.dart';

class MoviesWidget extends StatelessWidget {
  final List<MovieModel> items;

  const MoviesWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.pushNamed(context, movieDetailRoute, arguments: items[index].id.toString()),
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Stack(
                children: [
                  CacheImageWidget(
                      radius: 8,
                      height: 200,
                      width: 150,
                      fit: BoxFit.fill,
                      imageUrl: '$baseUrlImage${items[index].posterPath}'),
                  if (items[index].voteAverage != null)
                    Container(
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)),
                      height: 20,
                      width: 32,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(12),
                      child: Text(
                        items[index].voteAverage!.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white, fontSize: 10),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
