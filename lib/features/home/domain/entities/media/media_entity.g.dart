// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaEntity _$MediaEntityFromJson(Map<String, dynamic> json) => MediaEntity(
      mediaId: json['media_id'] as int?,
      mediaTitle: json['media_title'] as String?,
      mediaUrl: json['media_url'] as String?,
      artiste: json['artiste'] as String?,
      likes: json['likes'] as int?,
      views: json['views'] as int?,
      timeSinceUpload: json['time_since_upload'] as String?,
      uploadTime: (json['upload_time'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MediaEntityToJson(MediaEntity instance) =>
    <String, dynamic>{
      'media_id': instance.mediaId,
      'media_title': instance.mediaTitle,
      'media_url': instance.mediaUrl,
      'artiste': instance.artiste,
      'likes': instance.likes,
      'views': instance.views,
      'time_since_upload': instance.timeSinceUpload,
      'upload_time': instance.uploadTime,
    };
