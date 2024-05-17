import 'package:json_annotation/json_annotation.dart';
import 'package:umplay/features/common/domain/entities/region_entity.dart';
import 'package:umplay/features/home/domain/entities/artist_entity.dart';

part 'region_model.g.dart';

@JsonSerializable()
class RegionModel extends RegionEntity {
  RegionModel({
    required super.id,
    required super.uid,
    required super.name,
    required super.artistes,
    required super.createdAt,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegionModelToJson(this);
}
