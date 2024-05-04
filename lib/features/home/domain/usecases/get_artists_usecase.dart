import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/core/usecases/usecase.dart';
import 'package:umplay/features/home/domain/entities/artist_entity.dart';
import 'package:umplay/features/home/domain/repository/artitst_repository.dart';

class GetArtistsUseCase
    implements Usecase<DataState<List<ArtistEntity>>, void> {
  final ArtistRepository repository;

  GetArtistsUseCase(this.repository);

  @override
  Future<DataState<List<ArtistEntity>>> call(params) async {
    return await repository.getAllArtists();
  }
}
