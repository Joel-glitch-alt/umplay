import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/features/home/data/data_sources/remote/artist_remote.dart';
import 'package:umplay/features/home/domain/entities/artist_entity.dart';
import 'package:umplay/features/home/domain/repository/artitst_repository.dart';

class ArtistRepositoryImpl implements ArtistRepository {
  final ArtistRemoteDataSourceImpl artistRemoteDataSourceImpl;

  ArtistRepositoryImpl(this.artistRemoteDataSourceImpl);

  @override
  Future<DataState<List<ArtistEntity>>> getAllArtists() async {
    final response = await artistRemoteDataSourceImpl.getAllArtists();
    print(response);
    return DataSuccess(response.data);
  }

  @override
  Future<DataState<ArtistEntity>> getArtist(String id) {
    // TODO: implement getArtist
    throw UnimplementedError();
  }
}
