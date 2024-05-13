import 'package:dio/dio.dart';

class ErrorDioQueuedInterceptor extends QueuedInterceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionTimeout || err.type == DioExceptionType.receiveTimeout) {
    } else if (err.response?.data != null) {
    } else if (err.type == DioExceptionType.unknown) {
      if (err.type.name.contains('SocketException')) {}
    }
    return handler.reject(err);
  }
}
