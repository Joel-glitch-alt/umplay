import 'package:json_annotation/json_annotation.dart';

part 'media_entity.g.dart';

@JsonSerializable()
class MediaEntity {
  @JsonKey(name: "media_id")
  final int? mediaId;
  @JsonKey(name: "media_title")
  final String? mediaTitle;
  @JsonKey(name: "media_url")
  final String? mediaUrl;
  @JsonKey(name: "artiste")
  final String? artiste;
  @JsonKey(name: "likes")
  final int? likes;
  @JsonKey(name: "views")
  final int? views;
  @JsonKey(name: "time_since_upload")
  final String? timeSinceUpload;
  @JsonKey(name: "upload_time")
  final double? uploadTime;

  MediaEntity({
    this.mediaId,
    this.mediaTitle,
    this.mediaUrl,
    this.artiste,
    this.likes,
    this.views,
    this.timeSinceUpload,
    this.uploadTime,
  });

  factory MediaEntity.fromJson(Map<String, dynamic> json) =>
      _$MediaEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MediaEntityToJson(this);
}
