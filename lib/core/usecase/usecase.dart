import 'dart:async';
import 'package:get_it/get_it.dart';

abstract class BaseUseCase<P, R> extends Disposable {
  Future<R> call([P? params]);

  void onError(Object? e, [StackTrace? stackTrace]) {}

  @override
  FutureOr onDispose() {}
}

abstract class CompletableUseCase<P> extends BaseUseCase<P, void> {}

abstract class NoParamUseCase<R> extends BaseUseCase<dynamic, R> {}