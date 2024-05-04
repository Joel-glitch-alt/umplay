import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/features/home/domain/entities/artist_entity.dart';

abstract class ArtistRepository {
  Future<DataState<List<ArtistEntity>>> getAllArtists();
  Future<DataState<ArtistEntity>> getArtist(String id);
}
