// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionEntity _$RegionEntityFromJson(Map<String, dynamic> json) => RegionEntity(
      id: json['id'] as int?,
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      artistes: (json['artistes'] as List<dynamic>?)
          ?.map((e) => ArtistEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$RegionEntityToJson(RegionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'artistes': instance.artistes,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
