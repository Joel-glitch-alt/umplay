import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'artist_entity.g.dart';

@JsonSerializable()
class ArtistEntity {
  @JsonKey(name: "full_name")
  final String? fullName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "total_votes")
  final int? totalVotes;
  @JsonKey(name: "total_views")
  final int? totalViews;
  @JsonKey(name: "total_plays")
  final int? totalPlays;
  @JsonKey(name: "total_likes")
  final int? totalLikes;
  @JsonKey(name: "sub_status")
  final String? subStatus;

  ArtistEntity({
    this.fullName,
    this.email,
    this.totalVotes,
    this.totalViews,
    this.totalPlays,
    this.totalLikes,
    this.subStatus,
  });

  factory ArtistEntity.fromJson(Map<String, dynamic> json) =>
      _$ArtistEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistEntityToJson(this);
}
