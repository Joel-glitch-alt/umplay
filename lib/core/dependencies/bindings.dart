import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:umplay/core/services/auth_service.dart';
import 'package:umplay/features/auth/presentation/controllers/walkthrough_controller.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    injectStorageProvider();
    injectNetworkProvider();
    injectService();
    injectRepository();
    injectUseCase();
    injectController();
  }

  void injectStorageProvider() {
    // Get.put(LocalStorage(), permanent: true);
    // Get.put(UserStorage());
  }

  void injectNetworkProvider() {
    Get.put<Dio>(Dio());
  }

  void injectService() {
    // Get.put(LogServiceImpl());
    Get.put(AuthService());
    // Get.put<ConnectivityService>(ConnectivityServiceImpl());
    // Get.put<PermissionService>(PermissionServiceImpl());
    // Get.put<AuthService>(AuthServiceImpl());
    // Get.put(PushNotificationService());

    // Get.put(LoginApiService(Get.find<Dio>()), permanent: true);
  }

  void injectRepository() {
    // Get.put<AuthRepository>(AuthRepositoryImpl(Get.find<LoginApiService>()),
    //     permanent: true);
  }

  void injectUseCase() {
    // Get.put(LoginUseCase(authRepository: Get.find<AuthRepository>()));
  }

  void injectController() {
    Get.put(WalkthroughController());
  }
}
