import 'package:dio/dio.dart';
import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/features/authentication/data/data_sources/remote/login_api_service.dart';
import 'package:umplay/features/authentication/data/models/login_response.dart';
import 'package:umplay/features/authentication/domain/entities/login_request.dart';
import 'package:umplay/features/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LoginApiService _loginApiService;

  AuthRepositoryImpl(this._loginApiService);

  @override
  Future<DataState<LoginResponseModel>> login(LoginRequestEntity body) async {
    try {
      final httpResponse = await _loginApiService.login(body);
      // if (httpResponse.response.statusCode == HttpStatus.ok) {
      if (httpResponse.data.success != null &&
          httpResponse.data.success == true) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.unknown));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
