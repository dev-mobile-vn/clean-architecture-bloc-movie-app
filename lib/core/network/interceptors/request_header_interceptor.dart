import 'package:dio/dio.dart';
import 'package:movie_app/core/common/environment/environment.dart';

class RequestHeaderInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = Environment.kAuthorization;
    return handler.next(options);
  }
}
