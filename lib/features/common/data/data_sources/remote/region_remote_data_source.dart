import 'package:retrofit/retrofit.dart';
import 'package:umplay/features/common/data/models/region_model.dart';
import 'package:umplay/core/network/rest_client.dart';

abstract class RegionRemoteDataSource {
  Future<HttpResponse<List<RegionModel>>> getAllArtistsByRegions();
}

class RegionRemoteDataSourceImpl implements RegionRemoteDataSource {
  final RestClient restClient;
  RegionRemoteDataSourceImpl({required this.restClient});

  @override
  Future<HttpResponse<List<RegionModel>>> getAllArtistsByRegions() async {
    try {
      final response = await restClient.getAllArtistsByRegions();

      if (response.response.statusCode == 200) {
        final dynamic responseBody = response.data;

        // Check if 'success' is true and 'artistes' exist in 'info'
        if (responseBody['success'] == true && responseBody['info'] != null) {
          // Extract the list of regions
          print(responseBody);
          final List<dynamic> regionsJson = responseBody['info'];
          final List<RegionModel> artists = regionsJson
              .map((regionJson) => RegionModel.fromJson(regionJson))
              .toList();
          return HttpResponse(artists, response.response);
        } else {
          // Handle error cases here
          // For example, throw an exception or return an HttpResponse with an error message
          throw Exception('Failed to get artists');
        }
      }

      if (response.response.statusCode == 200) {
        final dynamic responseBody = response.data;

        if (responseBody != null) {
          final List<dynamic> artistsByRegionsJson = responseBody;
          final List<RegionModel> artistsByRegions = artistsByRegionsJson
              .map((artistsByRegion) => RegionModel.fromJson(artistsByRegion))
              .toList();
          return HttpResponse(artistsByRegions, response.response);
        } else {
          throw Exception('Failed to get regions');
        }
      } else {
        throw Exception(
            'Failed to get regions: ${response.response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get regions: $e');
    }
  }
}
