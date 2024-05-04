// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistEntity _$ArtistEntityFromJson(Map<String, dynamic> json) => ArtistEntity(
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      totalVotes: json['total_votes'] as int?,
      totalViews: json['total_views'] as int?,
      totalPlays: json['total_plays'] as int?,
      totalLikes: json['total_likes'] as int?,
      subStatus: json['sub_status'] as String?,
    );

Map<String, dynamic> _$ArtistEntityToJson(ArtistEntity instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'email': instance.email,
      'total_votes': instance.totalVotes,
      'total_views': instance.totalViews,
      'total_plays': instance.totalPlays,
      'total_likes': instance.totalLikes,
      'sub_status': instance.subStatus,
    };
