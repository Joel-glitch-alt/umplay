import 'package:umplay/core/constants/image_constants.dart';

class ArtistsFollowedListModel {
  String? artistImg;
  String? artistName;
  String? noOfLikes;
  bool? isFollow;
  bool? isLike;

  ArtistsFollowedListModel(
      {this.artistImg,
      this.artistName,
      this.noOfLikes,
      this.isLike = false,
      this.isFollow = false});
}

List<ArtistsFollowedListModel> getArtistsFollowedList() {
  List<ArtistsFollowedListModel> temp = [];

  temp.add(ArtistsFollowedListModel(
      artistImg: UImages.arianaGrandeArtists,
      artistName: 'Ariana Grande',
      noOfLikes: '400m listeners',
      isLike: true,
      isFollow: true));
  temp.add(ArtistsFollowedListModel(
      artistImg: UImages.duaLipaArt,
      artistName: 'Dua Lipa',
      noOfLikes: '300m listeners',
      isLike: true,
      isFollow: true));
  temp.add(ArtistsFollowedListModel(
      artistImg: UImages.selenaGomezArt,
      artistName: 'Selena Gomez',
      noOfLikes: '200m listeners',
      isLike: true,
      isFollow: true));
  temp.add(ArtistsFollowedListModel(
      artistImg: UImages.edSheeranArt,
      artistName: 'Ed Sheeran',
      noOfLikes: '100m listeners',
      isLike: true,
      isFollow: true));
  temp.add(ArtistsFollowedListModel(
      artistImg: UImages.justinBieberArt,
      artistName: 'Justin Bieber',
      noOfLikes: '500m listeners',
      isLike: true,
      isFollow: true));
  temp.add(ArtistsFollowedListModel(
      artistImg: UImages.oliviaRodrigoArt,
      artistName: 'Olivia Rodrigo',
      noOfLikes: '300m listeners',
      isLike: true,
      isFollow: true));
  temp.add(ArtistsFollowedListModel(
      artistImg: UImages.taylorSwiftArt,
      artistName: 'Taylor Swift',
      noOfLikes: '200m listeners',
      isLike: true,
      isFollow: true));
  temp.add(ArtistsFollowedListModel(
      artistImg: UImages.billieEilishArt,
      artistName: 'Billie Eilish',
      noOfLikes: '100m listeners',
      isLike: true,
      isFollow: true));
  temp.add(ArtistsFollowedListModel(
      artistImg: UImages.charliePuthArt,
      artistName: 'Charlie Puth',
      noOfLikes: '400m listeners',
      isLike: true,
      isFollow: true));
  temp.add(ArtistsFollowedListModel(
      artistImg: UImages.alanWalkerArtists,
      artistName: 'Alan Walker',
      noOfLikes: '400m listeners',
      isLike: true,
      isFollow: true));
  temp.add(ArtistsFollowedListModel(
      artistImg: UImages.akonArtists,
      artistName: 'Akon',
      noOfLikes: '400m listeners',
      isLike: true,
      isFollow: true));

  return temp;
}
