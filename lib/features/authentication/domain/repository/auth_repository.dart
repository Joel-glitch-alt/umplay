import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/features/authentication/domain/entities/login_response.dart';
import 'package:umplay/features/authentication/domain/entities/login_request.dart';
import 'package:umplay/features/authentication/domain/entities/register_request.dart';
import 'package:umplay/features/authentication/domain/entities/register_response.dart';

abstract class AuthRepository {
  Future<DataState<LoginResponseEntity>> login(LoginRequestEntity body);
}
