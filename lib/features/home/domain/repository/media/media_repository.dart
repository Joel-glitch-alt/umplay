import 'package:umplay/features/home/domain/entities/media/media_entity.dart';

abstract class MediaRepository {
  Future<MediaEntity?> getMedia(String id);
  Future<MediaEntity?> getMediaByName(String name);
  Future<MediaEntity?> getMediaByPath(String path);
  Future<List<MediaEntity>?> getMediaByArtist(String id);
  Future<List<MediaEntity>?> getMediaByAlbum(String id);
  Future<List<MediaEntity>?> getMediaByGenre(String id);
  Future<List<MediaEntity>?> getMediaByYear(String year);
  Future<List<MediaEntity>?> getMediaBySearch(String query);
  Future<List<MediaEntity>?> getMediaByDate(String date);
  Future<List<MediaEntity>?> getMediaByRating(String rating);

  Future<List<MediaEntity>?> getMediaByPathAndType(String path, String type);
}
