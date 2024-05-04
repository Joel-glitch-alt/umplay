import 'package:dio/dio.dart';
import 'package:umplay/core/network/dio/request_interceptor.dart';
import 'package:umplay/core/network/dio/token_interceptor.dart';

Dio buildDioOptions(String base) {
  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: base,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );

  dio.interceptors.addAll([RequestInterceptor(), TokenInterceptor(dio: dio)]);

  return dio;
}
