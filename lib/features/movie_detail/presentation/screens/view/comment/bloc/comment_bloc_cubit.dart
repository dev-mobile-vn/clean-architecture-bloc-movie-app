
import 'package:movie_app/core/bloc/base_movie_status.dart';
import 'package:movie_app/features/movie_detail/data/model/review_model.dart';
import 'package:movie_app/features/movie_detail/domain/use_case/review_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'comment_bloc_state.dart';

class CommentBlocCubit extends Cubit<CommentBlocState> {
  CommentBlocCubit(this.reviewUseCase) : super(CommentBlocState.init());

  final ReviewUseCase reviewUseCase;

  void getReviews(String id) async {
    try {
      emit(state.copyWith(status: BaseMovieStatus.loading));
      ReviewsResponse response = await reviewUseCase(id);
      if (response.reviews.isNotEmpty) {
        emit(state.copyWith(status: BaseMovieStatus.success, data: state.data.copyWith(reviewsResponse: response)));
      } else {
        emit(state.copyWith(status: BaseMovieStatus.empty));
      }
    } catch (e) {
      emit(state.copyWith(status: BaseMovieStatus.success));
    }
  }
}
