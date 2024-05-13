import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/movie_detail/data/model/trailer_model.dart';
import 'package:movie_app/features/movie_detail/domain/repository/movie_detail_repository.dart';

class TrailerUseCase extends BaseUseCase<String, TrailerResponse> {
  final MovieDetailRepository _repository;

  TrailerUseCase(this._repository);

  @override
  Future<TrailerResponse> call([params]) async {
    return await _repository.getTrailerMovie(params!);
  }
}
