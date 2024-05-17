import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/features/common/data/models/region_model.dart';
import 'package:umplay/features/common/domain/entities/region_entity.dart';

abstract class RegionRepository {
  Future<DataState<List<RegionEntity>>> getAllArtistsByRegions();
}
