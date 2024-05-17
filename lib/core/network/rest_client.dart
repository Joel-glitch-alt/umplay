import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:umplay/core/constants/endpoints.dart';
import 'package:umplay/core/network/api_result.dart';
import 'package:umplay/features/home/data/models/artist_model.dart';
import 'package:umplay/features/home/domain/entities/artist_entity.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  //artiste
  @Headers({'Content-Type': 'application/json'})
  @GET(Endpoints.getAllArtistUrl)
  Future<HttpResponse<dynamic>> getAllArtists();

  @Headers({'Content-Type': 'application/json'})
  @GET(Endpoints.getArtistByIdUrl)
  Future<HttpResponse<ArtistModel>> getArtist(@Path('id') String id);

  //media
  @Headers({'Content-Type': 'application/json'})
  @GET(Endpoints.getAllTrendingVideos)
  Future<HttpResponse<dynamic>> getTrendingVideos();

  //regions
  @Headers({'Content-Type': 'application/json'})
  @GET(Endpoints.getAllArtistsByRegions)
  Future<HttpResponse<dynamic>> getAllArtistsByRegions();
}
