// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaModel _$MediaModelFromJson(Map<String, dynamic> json) => MediaModel(
      mediaId: json['media_id'] as int?,
      mediaTitle: json['media_title'] as String?,
      artiste: json['artiste'] as String?,
      mediaUrl: json['media_url'] as String?,
      likes: json['likes'] as int?,
      views: json['views'] as int?,
      uploadTime: (json['upload_time'] as num?)?.toDouble(),
      timeSinceUpload: json['time_since_upload'] as String?,
    );

Map<String, dynamic> _$MediaModelToJson(MediaModel instance) =>
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
