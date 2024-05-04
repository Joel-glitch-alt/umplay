import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:umplay/core/components/loaders.dart';
import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/features/home/data/models/artist_model.dart';
import 'package:umplay/features/home/domain/entities/artist_entity.dart';
import 'package:umplay/features/home/domain/usecases/get_artists_usecase.dart';

class ArtistController extends GetxController {
  static GetArtistsUseCase get getArtistsUseCase => Get.find();
  final RxList<ArtistEntity> artists = <ArtistEntity>[].obs;

  Future<DataState<List<ArtistEntity>>> getAllArtists(params) async {
    final dataState = await getArtistsUseCase.call(null);
    if (dataState is DataSuccess) {
      artists.assignAll(dataState.data!);
      return dataState;
    } else if (dataState is DataFailed) {
      if (kDebugMode) {
        print(dataState.error);
        Loaders.showError(
            title: 'Something went wrong', message: dataState.error.toString());
      }
      return dataState; // Return the DataFailed instance
    } else {
      return DataFailed(
          dataState.error!); // Return an error state for unknown errors
    }
  }
}
