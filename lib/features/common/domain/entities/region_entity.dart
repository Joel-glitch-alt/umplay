import 'package:json_annotation/json_annotation.dart';
import 'package:umplay/features/home/domain/entities/artist_entity.dart';

part 'region_entity.g.dart';

@JsonSerializable()
class RegionEntity {
  int? id;
  String? uid;
  String? name;
  List<ArtistEntity>? artistes;
  DateTime? createdAt;

  RegionEntity({
    this.id,
    this.uid,
    this.name,
    this.artistes,
    this.createdAt,
  });

  factory RegionEntity.fromJson(Map<String, dynamic> json) =>
      _$RegionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RegionEntityToJson(this);
}
