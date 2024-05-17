import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/core/usecase/usecase.dart';
import 'package:umplay/features/authentication/domain/entities/Register_request.dart';
import 'package:umplay/features/authentication/domain/entities/Register_response.dart';
import 'package:umplay/features/authentication/domain/repository/auth_repository.dart';

class RegisterUseCase
    implements
        UseCase<DataState<RegisterResponseEntity>, RegisterRequsetEntity> {
  final AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});

  @override
  Future<DataState<RegisterResponseEntity>> call(RegisterRequsetEntity params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
