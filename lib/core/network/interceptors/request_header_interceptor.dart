import 'package:movie_app/config/network_constants.dart';
import 'package:dio/dio.dart';

class RequestHeaderInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = kAuthorization;
    return handler.next(options);
  }
}
