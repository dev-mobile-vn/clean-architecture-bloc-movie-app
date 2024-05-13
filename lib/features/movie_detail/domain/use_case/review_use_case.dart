import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/movie_detail/data/model/review_model.dart';
import 'package:movie_app/features/movie_detail/domain/repository/movie_detail_repository.dart';

class ReviewUseCase extends BaseUseCase<String, ReviewsResponse> {
  final MovieDetailRepository _repository;

  ReviewUseCase(this._repository);

  @override
  Future<ReviewsResponse> call([params]) async {
    return _repository.getReviewsMovie(params!);
  }
}
