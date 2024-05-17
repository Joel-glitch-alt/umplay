import 'package:dio/dio.dart';
import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/features/common/data/data_sources/remote/region_remote_data_source.dart';
import 'package:umplay/features/common/data/models/region_model.dart';
import 'package:umplay/features/common/domain/repository/region_repository.dart';

class RegionRepositoryImpl implements RegionRepository {
  final RegionRemoteDataSourceImpl regionRemoteDataSourceImpl;

  RegionRepositoryImpl({required this.regionRemoteDataSourceImpl});

  @override
  Future<DataState<List<RegionModel>>> getAllArtistsByRegions() async {
    try {
      final response =
          await regionRemoteDataSourceImpl.getAllArtistsByRegions();
      return DataSuccess(response.data);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
