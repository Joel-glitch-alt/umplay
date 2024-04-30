import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:umplay/core/constants/endpoints.dart';
import 'package:umplay/core/network/dio/request_interceptor.dart';
import 'package:umplay/core/network/dio/token_interceptor.dart';

part 'dio_client.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class DioClient {
  factory DioClient(String baseUrl) {
    final prettyDioLogger = PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    );

    final baseOptions = BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5));

    Dio dio = Dio();
    dio.options = baseOptions;
    dio.interceptors.clear();
    dio.interceptors.addAll([
      RequestInterceptor(),
      TokenInterceptor(dio: dio),
    ]);
    if (!kReleaseMode) {
      dio.interceptors.add(prettyDioLogger);
    }
    // defining base url
    return _DioClient(dio, baseUrl: baseUrl);
  }
}
