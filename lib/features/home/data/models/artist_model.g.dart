// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistModel _$ArtistModelFromJson(Map<String, dynamic> json) => ArtistModel(
      email: json['email'] as String?,
      fullName: json['full_name'] as String?,
      subStatus: json['sub_status'] as String?,
      totalLikes: json['total_likes'] as int?,
      totalPlays: json['total_plays'] as int?,
      totalViews: json['total_views'] as int?,
      totalVotes: json['total_votes'] as int?,
    );

Map<String, dynamic> _$ArtistModelToJson(ArtistModel instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'email': instance.email,
      'total_votes': instance.totalVotes,
      'total_views': instance.totalViews,
      'total_plays': instance.totalPlays,
      'total_likes': instance.totalLikes,
      'sub_status': instance.subStatus,
    };
