import 'package:dio/dio.dart';

abstract class NetworkApiProvider {
  final Dio dio = Dio();

  void init();

  void addInterceptors() {}

  void close({bool force = false}) {
    dio.close(force: force);
  }
}
