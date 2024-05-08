import 'package:retrofit/retrofit.dart';
import 'package:umplay/core/network/rest_client.dart';
import 'package:umplay/features/home/data/models/media/media_model.dart';

abstract class MediaRemoteDataSource {
  Future<HttpResponse<List<MediaModel>>> getAllTrendingVideos();
}

class MediaRemoteDataSourceImpl implements MediaRemoteDataSource {
  Restclient restClient;

  MediaRemoteDataSourceImpl(
    this.restClient,
  );

  @override
  Future<HttpResponse<List<MediaModel>>> getAllTrendingVideos() async {
    try {
      final response = await restClient.getTrendingVideos();
      if (response.response.statusCode == 200) {
        final dynamic responseBody = response.data;

        // Check if 'success' is true and 'trendingVideos' exist in 'info'
        if (responseBody['success'] == true && responseBody['info'] != null) {
          // Extract the list of trendingVideos
          final List<dynamic> trendingVideosJson = responseBody['info'];
          final List<MediaModel> trendingVideos = trendingVideosJson
              .map((trendingVideo) => MediaModel.fromJson(trendingVideo))
              .toList();
          return HttpResponse(trendingVideos, response.response);
        } else {
          // Handle error cases here
          // For example, throw an exception or return an HttpResponse with an error message
          throw Exception('Failed to get trending Videos');
        }
      } else {
        // Handle non-200 status code here
        // For example, throw an exception or return an HttpResponse with an error message
        throw Exception(
            'Failed to get trendingVideos: ${response.response.statusCode}');
      }
    } catch (e) {
      // Handle Dio errors or any other exceptions here
      // For example, throw an exception or return an HttpResponse with an error message
      throw Exception('Failed to get trendingVideos: $e');
    }
  }
}
