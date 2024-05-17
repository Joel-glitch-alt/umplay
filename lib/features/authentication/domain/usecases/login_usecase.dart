import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/core/usecase/usecase.dart';
import 'package:umplay/features/authentication/domain/entities/login_request.dart';
import 'package:umplay/features/authentication/domain/entities/login_response.dart';
import 'package:umplay/features/authentication/domain/repository/auth_repository.dart';

class LoginUseCase
    implements UseCase<DataState<LoginResponseEntity>, LoginRequestEntity> {
  final AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  @override
  Future<DataState<LoginResponseEntity>> call(LoginRequestEntity body) {
    return authRepository.login(body);
  }
}
