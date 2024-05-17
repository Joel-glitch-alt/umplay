
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:umplay/core/constants/api_constants.dart';
import 'package:umplay/features/authentication/data/models/login_response.dart';
import 'package:umplay/features/authentication/domain/entities/login_request.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseAPI)
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @Headers({'Content-Type': 'application/json'})
  @POST('/account/login/')
  Future<HttpResponse<LoginResponseModel>> login(
      @Body() LoginRequestEntity body);
}
