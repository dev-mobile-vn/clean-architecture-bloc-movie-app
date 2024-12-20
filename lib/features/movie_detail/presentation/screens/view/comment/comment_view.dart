import 'package:movie_app/core/bloc/base_movie_status.dart';
import 'package:movie_app/core/common/extensions/text_style_extension.dart';
import 'package:movie_app/di/dependency_injection.dart';
import 'package:movie_app/features/movie_detail/data/model/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common/contants/routers.dart';
import '../../../../../../core/common/widgets/loading.dart';
import '../../../../../../core/common/widgets/svg_widget.dart';
import '../../../../../../core/config/network_constants.dart';
import 'bloc/comment_bloc_cubit.dart';

class CommentsView extends StatefulWidget {
  final String id;

  const CommentsView({
    super.key,
    required this.id,
  });

  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  late CommentBlocCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = CommentBlocCubit(sl.get());
    cubit.getReviews(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBlocCubit, CommentBlocState>(
      bloc: cubit,
      builder: (context, state) {
        if (state.status == BaseMovieStatus.loading) {
          return const Loading();
        } else if (state.status == BaseMovieStatus.success) {
          ReviewsResponse? data = state.data.reviewsResponse;
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              if (data?.totalResults != null)
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      '${data!.totalResults} Comments',
                      style: context.titleMedium,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, postCommentRoute, arguments: widget.id),
                      child: Text(
                        'See all',
                        style: context.bodyMedium.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    ReviewModel item = data!.reviews[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16,),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 28, // Image radius
                            backgroundImage: NetworkImage('$baseUrlAvatar${item.authorDetail.avatarPath}'),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.author, style: context.labelMedium),
                                Text(
                                  item.content,
                                  maxLines: 2,
                                  style: context.bodyMedium.copyWith(overflow: TextOverflow.ellipsis, fontSize: 12),
                                ),
                                const SizedBox(height: 4,),
                                Row(
                                  children: [
                                    SvgWidget(
                                      ic: index % 2 == 0 ? "assets/icons/ic_love.svg" : 'assets/icons/ic_heart.svg',
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    const SizedBox(width: 4,),
                                    Text('200', style: context.bodySmall.copyWith(fontSize: 12, color: Colors.grey),),
                                    const SizedBox(width: 20,),
                                    Text('2 days ago', style: context.bodySmall.copyWith(fontSize: 12, color: Colors.grey),),
                                    const SizedBox(width: 20,),
                                    Text('Reply', style: context.bodySmall.copyWith(fontSize: 12, color: Colors.grey),),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: data?.reviews != null ? data!.reviews.length : 0,
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
