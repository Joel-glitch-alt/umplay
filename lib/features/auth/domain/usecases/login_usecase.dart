import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/core/usecases/usecase.dart';
import 'package:umplay/features/auth/domain/entities/login_request.dart';
import 'package:umplay/features/auth/domain/entities/login_response.dart';
import 'package:umplay/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase
    implements Usecase<DataState<LoginResponseEntity>, LoginRequestEntity> {
  final AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  @override
  Future<DataState<LoginResponseEntity>> call(LoginRequestEntity body) {
    return authRepository.login(body);
  }
}
