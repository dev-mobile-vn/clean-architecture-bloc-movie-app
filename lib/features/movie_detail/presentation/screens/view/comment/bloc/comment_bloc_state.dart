part of 'comment_bloc_cubit.dart';

class CommentBlocState extends Equatable {
  final BaseMovieStatus status;
  final CommentMovieData data;

  const CommentBlocState({required this.status, required this.data});

  factory CommentBlocState.init() => const CommentBlocState(status: BaseMovieStatus.init, data: CommentMovieData());

  CommentBlocState copyWith({final BaseMovieStatus? status, final CommentMovieData? data}) => CommentBlocState(status: status ?? this.status, data: data ?? this.data);

  @override
  List<Object?> get props => [status, data];
}

class  CommentMovieData extends Equatable {
  final ReviewsResponse? reviewsResponse;

  const CommentMovieData({this.reviewsResponse});

  @override
  List<Object?> get props => [reviewsResponse];

  CommentMovieData copyWith({final  ReviewsResponse? reviewsResponse,}) {
    return CommentMovieData(reviewsResponse: reviewsResponse ?? this.reviewsResponse);
  }
}
