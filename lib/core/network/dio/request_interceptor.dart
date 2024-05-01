import 'dart:io';

import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['API-REQUEST-FROM'] = Platform.isIOS ? "IOS" : "Android";
    super.onRequest(options, handler);
  }
}
