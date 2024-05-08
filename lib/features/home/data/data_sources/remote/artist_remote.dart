import 'package:retrofit/retrofit.dart';
import 'package:umplay/core/network/rest_client.dart';
import 'package:umplay/features/home/data/models/artist_model.dart';

abstract class ArtistRemoteDataSource {
  Future<HttpResponse<List<ArtistModel>>> getAllArtists();
  Future<HttpResponse<ArtistModel>> getArtist(
    String id,
  );
}

class ArtistRemoteDataSourceImpl implements ArtistRemoteDataSource {
  Restclient restClient;

  ArtistRemoteDataSourceImpl(
    this.restClient,
  );

  @override
  Future<HttpResponse<List<ArtistModel>>> getAllArtists() async {
    try {
      final response = await restClient.getAllArtists();
      if (response.response.statusCode == 200) {
        final dynamic responseBody = response.data;

        // Check if 'success' is true and 'artistes' exist in 'info'
        if (responseBody['success'] == true &&
            responseBody['info'] != null &&
            responseBody['info']['artistes'] != null) {
          // Extract the list of artists
          final List<dynamic> artistesJson = responseBody['info']['artistes'];
          final List<ArtistModel> artists = artistesJson
              .map((artistJson) => ArtistModel.fromJson(artistJson))
              .toList();
          return HttpResponse(artists, response.response);
        } else {
          // Handle error cases here
          // For example, throw an exception or return an HttpResponse with an error message
          throw Exception('Failed to get artists');
        }
      } else {
        // Handle non-200 status code here
        // For example, throw an exception or return an HttpResponse with an error message
        throw Exception(
            'Failed to get artists: ${response.response.statusCode}');
      }
    } catch (e) {
      // Handle Dio errors or any other exceptions here
      // For example, throw an exception or return an HttpResponse with an error message
      throw Exception('Failed to get artists: $e');
    }
  }

  @override
  Future<HttpResponse<ArtistModel>> getArtist(String id) {
    // TODO: implement getArtist
    throw UnimplementedError();
  }
}

  // factory ArtistRemoteDataSourceImpl(Dio dio, {String baseUrl}) = _ArtistRemoteDataSourceImpl;

  //artiste
  

// class ArtistRemoteDataSourceImpl implements ArtistRemoteDataSource {
//   Restclient restClient;

//   ArtistRemoteDataSourceImpl(
//     this.restClient,
//   );

//   // DioClient dioClient;
//   // factory ArtistRemoteDataSourceImpl(DioClient dioClient) = _ArtistRemoteDataSourceImpl;

//   // ArtistRemoteDataSourceImpl({required this.dioClient});

//   @override
//   Future<HttpResponse<List<ArtistModel>>> getAllArtists() async {
//     try {
//       return await restClient.getAllArtists();
//       // final response = await restClient.getAllArtists();
//       // if (response.statusCode == HttpStatus.ok) {
//       //   final Map<String, dynamic> parsedResponse = json.decode(response);

//       //   final articleList = (parsedResponse['info']['artistes'] as List)
//       //       .map((json) => ArtistModel.fromJson(json))
//       //       .toList();
//       //   return DataSuccess<List<ArtistModel>>(articleList);
//       // } else {
//       //   throw Exception('-e');
//       // }
//     } catch (e) {
//       throw Exception('Failed to fetch all artists: $e');
//     }
//   }

//   @override
//   Future<HttpResponse<ArtistModel>> getArtist(String id) async {
//     try {
//       return await restClient.getArtist(id);
//       // final response = await restClient.getArtist(id);

//       // return DataSuccess(response);
//     } catch (e) {
//       throw Exception('Failed to fetch all artists: $e');
//     }
//   }
// }
