class Endpoints {
  const Endpoints._();

  static const String baseUrl = 'https://devapi.universalmusicplay.com';
  static const String getAllArtistUrl = "$baseUrl/account/all_artistes";
  static const String getArtistByIdUrl = "$baseUrl/account/users";
  static const String getAllTrendingVideos =
      "$baseUrl/media/fetch-trending_videos";
}
