import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:umplay/core/services/auth_service.dart';

class TokenInterceptor extends Interceptor {
  final AuthService _authService = Get.find<AuthService>();

  TokenInterceptor({required Dio dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _authService.accessToken;
    if (token.isNotEmpty) {
      options.headers['Authorization'] = token.toString();
    }
    return handler.next(options);
  }

}
