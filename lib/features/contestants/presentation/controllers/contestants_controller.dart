import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:umplay/core/components/loaders.dart';
import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/features/common/domain/entities/region_entity.dart';
import 'package:umplay/features/common/domain/usecases/get_artists_by_regions_usecase.dart';

class ContestantsController extends GetxController {
  static GetArtistsByRegionUseCase get getArtistsByRegionUseCase => Get.find();
  final RxList<RegionEntity> artistsByRegions = <RegionEntity>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    debugPrint('init');
    getArtistsByRegion(null);
  }

  Future<DataState<List<RegionEntity>>> getArtistsByRegion(params) async {
    isLoading.value = true;

    final dataState = await getArtistsByRegionUseCase.call(null);
    if (dataState is DataSuccess) {
      artistsByRegions.assignAll(dataState.data!);
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
    artistsByRegions.clear();
    isLoading.value = false;
    debugPrint('dispose');
  }
}
