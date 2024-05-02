import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:umplay/core/constants/endpoints.dart';
import 'package:umplay/features/auth/data/models/login_response.dart';
import 'package:umplay/features/auth/domain/entities/login_request.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @Headers({'Content-Type': 'application/json'})
  @POST('/account/login/')
  Future<HttpResponse<LoginResponseModel>> login(
      @Body() LoginRequestEntity body);
}
