import 'package:dio/dio.dart';

class RequestHeaderInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = '';
    return handler.next(options);
  }
}
