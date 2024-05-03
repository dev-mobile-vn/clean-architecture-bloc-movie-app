import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'contants.dart';
import 'interceptors/error_dio_interceptor.dart';
import 'interceptors/request_header_interceptor.dart';
import 'network_api_provider.dart';

class MovieProvider extends NetworkApiProvider {
  @override
  void init() {
    dio.options = BaseOptions(
        baseUrl: '',
        connectTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 30000),
        sendTimeout: const Duration(milliseconds: 30000),
        headers: {
          "Accept": SupportedContentType.jsonContentType,
          "Content-Type": SupportedContentType.contentTypeHeader,
        });
  }

  @override
  void addInterceptors() {
    dio.interceptors.add(RequestHeaderInterceptor());
    dio.interceptors.add(ErrorDioQueuedInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ));
    }
  }
}
