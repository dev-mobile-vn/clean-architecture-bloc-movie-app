import 'package:movie_app/config/flavor_config.dart';
import 'package:movie_app/core/network/network_api_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'contants.dart';
import 'interceptors/error_dio_interceptor.dart';
import 'interceptors/request_header_interceptor.dart';

class SearchMovieProvider extends NetworkApiProvider {
  @override
  void init() {
    dio.options = BaseOptions(
        baseUrl: FlavorConfig.values.baseUrlApiSearchMovie,
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
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }
}
