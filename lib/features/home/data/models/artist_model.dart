import 'package:umplay/features/home/domain/entities/artist_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'artist_model.g.dart';

@JsonSerializable()
class ArtistModel extends ArtistEntity {
  ArtistModel(
      {super.email,
      super.fullName,
      super.subStatus,
      super.totalLikes,
      super.totalPlays,
      super.totalViews,
      super.totalVotes});

  factory ArtistModel.fromJson(Map<String, dynamic> json) =>
      _$ArtistModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistModelToJson(this);
}
