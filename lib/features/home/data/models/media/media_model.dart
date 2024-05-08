import 'package:json_annotation/json_annotation.dart';
import 'package:umplay/features/home/domain/entities/media/media_entity.dart';

part 'media_model.g.dart';

@JsonSerializable()
class MediaModel extends MediaEntity {
  MediaModel({
    super.mediaId,
    super.mediaTitle,
    super.artiste,
    super.mediaUrl,
    super.likes,
    super.views,
    super.uploadTime,
    super.timeSinceUpload,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MediaModelToJson(this);
}
