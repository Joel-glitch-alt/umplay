import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:umplay/core/components/loaders.dart';
import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/features/home/domain/entities/artist_entity.dart';
import 'package:umplay/features/home/domain/usecases/get_artists_usecase.dart';

class ArtistController extends GetxController {
  static GetArtistsUseCase get getArtistsUseCase => Get.find();
  final RxList<ArtistEntity> artists = <ArtistEntity>[].obs;
  final RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    print('init');
    getAllArtists(null);
  }

  @override
  void onReady() {
    super.onReady();
    print('ready');
    getAllArtists(null);
  }

  Future<DataState<List<ArtistEntity>>> getAllArtists(params) async {
    isLoading.value = true;

    final dataState = await getArtistsUseCase.call(null);
    if (dataState is DataSuccess) {
      artists.assignAll(dataState.data!);
      isLoading.value = false;
      return dataState;
    } else if (dataState is DataFailed) {
      if (kDebugMode) {
        print(dataState.error);
        Loaders.showError(
            title: 'Something went wrong', message: dataState.error.toString());
      }
      isLoading.value = false;
      return dataState; // Return the DataFailed instance
    } else {
      isLoading.value = false;
      return DataFailed(
          dataState.error!); // Return an error state for unknown errors
    }
  }

  @override
  void dispose() {
    artists.clear();
    isLoading.value = false;
    debugPrint('dispose');
  }
}
