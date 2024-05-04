import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:umplay/core/network/rest_client.dart';
import 'package:umplay/core/services/auth_service.dart';
import 'package:umplay/features/auth/data/data_sources/remote/login_api_service.dart';
import 'package:umplay/features/auth/data/repository/auth_repository.dart';
import 'package:umplay/features/auth/domain/repository/auth_repository.dart';
import 'package:umplay/features/auth/domain/usecases/login_usecase.dart';
import 'package:umplay/features/auth/presentation/controllers/walkthrough_controller.dart';
import 'package:umplay/core/constants/endpoints.dart';
import 'package:umplay/core/network/dio_client.dart';
import 'package:umplay/features/home/data/data_sources/remote/artist_remote.dart';
import 'package:umplay/features/home/data/repository/artist_repository_impl.dart';
import 'package:umplay/features/home/domain/repository/artitst_repository.dart';
import 'package:umplay/features/home/domain/usecases/get_artists_usecase.dart';
import 'package:umplay/features/home/presentation/controllers/artist_controller.dart';

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
    Get.put<Dio>(Dio());
  }

  void injectNetworkProvider() {
    final dio = buildDioOptions(Endpoints.baseUrl);
    Get.put<Dio>(Dio());
    Get.put<Restclient>(Restclient(dio));
    // Get.put<DioClient>(DioClient(Endpoints.baseUrl));
  }

  void injectService() {
    // Get.put(LogServiceImpl());
    Get.put(AuthService());
    // Get.put<ConnectivityService>(ConnectivityServiceImpl());
    // Get.put<PermissionService>(PermissionServiceImpl());

    // Get.put(PushNotificationService());

    Get.put(LoginApiService(Get.find<Dio>()), permanent: true);
    // Get.put(ArtistRemoteDataSource(Get.find<Dio>(), Endpoints.baseUrl),
    // permanent: true);
    Get.put<ArtistRemoteDataSourceImpl>(
        ArtistRemoteDataSourceImpl(Restclient(Get.find<Dio>())),
        permanent: true);
  }

  void injectRepository() {
    Get.put(AuthRepositoryImpl((Get.find<LoginApiService>())));
    Get.put<AuthRepository>(AuthRepositoryImpl(Get.find<LoginApiService>()),
        permanent: true);

    Get.put<ArtistRepository>(
        ArtistRepositoryImpl(Get.find<ArtistRemoteDataSourceImpl>()));
  }

  void injectUseCase() {
    Get.put(LoginUseCase(authRepository: Get.find<AuthRepositoryImpl>()));
    Get.put<GetArtistsUseCase>(GetArtistsUseCase(Get.find<ArtistRepository>()));
  }

  void injectController() {
    Get.put(WalkthroughController());
    Get.lazyPut<ArtistController>(() => ArtistController());
  }
}
