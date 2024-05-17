import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/core/usecases/usecase.dart';
import 'package:umplay/features/common/domain/entities/region_entity.dart';
import 'package:umplay/features/common/domain/repository/region_repository.dart';

class GetArtistsByRegionUseCase
    implements Usecase<DataState<List<RegionEntity>>, void> {
  final RegionRepository repository;

  GetArtistsByRegionUseCase({required this.repository});

  @override
  Future<DataState<List<RegionEntity>>> call(params) async {
    return await repository.getAllArtistsByRegions();
  }
}
