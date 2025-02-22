import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/components/app_scaffold.dart';
import '../../../../core/components/cached_image_widget.dart';
import '../../../../core/components/view_all_label_component.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/common.dart';
import '../../../../core/constants/images.dart';
import '../../notification/notification_screen.dart';
import '../../search/search_screen.dart';
import '../component/top_artists_component.dart';
import '../model/dashboard_data_model.dart';

class ArtistsFragment extends StatefulWidget {
  const ArtistsFragment({super.key});

  @override
  _ArtistsFragmentState createState() => _ArtistsFragmentState();
}

class _ArtistsFragmentState extends State<ArtistsFragment> {
  List<DashBoardDataModel> getFavoriteArtistList = getFavoritesArtistsList();

  List<String> artistList = [
    alan_walker_artists,
    tim_david_artists,
    marsh_mello_artists,
    akon_artists
  ];
  List<String> artistName = ['Alan Walker', 'Tim David', 'MarshMellow', 'Akon'];

  int selectArtistIndex = 0;

  String selectArtistsImage = alan_walker_artists;
  String selectArtistsName = 'Alan Walker';

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget buildTopWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: boxDecorationDefault(
            color: Colors.grey.withAlpha(25),
            borderRadius: radius(18),
            boxShadow: defaultBoxShadow(
                blurRadius: 0,
                shadowColor: Colors.black.withAlpha(20),
                spreadRadius: 0),
          ),
          child: Stack(
            children: [
              CachedImageWidget(
                url: selectArtistsImage,
                height: 280,
                width: context.width(),
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(18).paddingAll(6),
              Positioned(
                left: 0,
                right: 30,
                top: 16,
                child: Blur(
                  blur: 1,
                  borderRadius: radius(18),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: boxDecorationDefault(
                      color: blurBlackColor.withOpacity(0.2),
                      borderRadius: radius(18),
                      boxShadow: defaultBoxShadow(
                          blurRadius: 0,
                          spreadRadius: 0,
                          shadowColor: Colors.black.withAlpha(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Marquee(
                            child: Text(selectArtistsName,
                                style: boldTextStyle())),
                        Marquee(
                            child: Text('400m monthly listeners',
                                style: secondaryTextStyle(
                                    color: textPrimaryColorGlobal))),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 16),
                ),
              )
            ],
          ),
        ).expand(flex: 3),
        AnimatedWrap(
          runSpacing: 16,
          itemCount: artistList.length,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                selectArtistIndex = index;
                selectArtistsImage = artistList[index];
                selectArtistsName = artistName[index];
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.all(3),
                alignment: Alignment.center,
                width: 61,
                height: 61,
                decoration: boxDecorationDefault(
                  color: index == selectArtistIndex
                      ? null
                      : Colors.grey.withAlpha(25),
                  borderRadius: radius(16),
                  boxShadow: defaultBoxShadow(
                      blurRadius: 0,
                      shadowColor: Colors.black.withAlpha(20),
                      spreadRadius: 0),
                  gradient: index == selectArtistIndex
                      ? primaryHomeLinearGradient()
                      : null,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CachedImageWidget(
                      url: artistList[index],
                      height: 61,
                      radius: 16,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      width: 61,
                    ),
                    if (index == selectArtistIndex)
                      Positioned(
                        child: Blur(
                          blur: 0.5,
                          width: 61,
                          height: 61,
                          borderRadius: radius(16),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: boxDecorationDefault(
                                color: blurBlackColor.withOpacity(0.4),
                                borderRadius: radius(16)),
                            child: Text(selectArtistsName,
                                style: secondaryTextStyle(
                                    color: textPrimaryColorGlobal),
                                textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ).expand(),
      ],
    );
  }

  Widget buildFavoritesArtists() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewAllLabel(
          label: 'Your Favorites',
          onTap: () {
            //
          },
        ).paddingSymmetric(horizontal: 16),
        12.height,
        HorizontalList(
          spacing: 16,
          runSpacing: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: getFavoriteArtistList.length,
          itemBuilder: (context, index) {
            DashBoardDataModel favoriteArtistListData =
                getFavoriteArtistList[index];
            return Container(
              width: 130,
              decoration: boxDecorationDefault(
                color: Colors.grey.withAlpha(25),
                borderRadius: radius(18),
                boxShadow: defaultBoxShadow(
                    blurRadius: 0,
                    shadowColor: Colors.black.withAlpha(20),
                    spreadRadius: 0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedImageWidget(
                    url: favoriteArtistListData.img.validate(),
                    height: 100,
                    width: context.width(),
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRect(18).paddingAll(10),
                  Marquee(
                          child: Text(
                              favoriteArtistListData.podcastsTitle.validate(),
                              style: primaryTextStyle()))
                      .paddingAll(10),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: commonAppBarWidget(
        context,
        title: 'Artists',
        actionWidget1: IconButton(
          icon: Image.asset(ic_search, height: 22, width: 22),
          onPressed: () {
            const SearchScreen()
                .launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
          },
        ),
        actionWidget2: IconButton(
          icon: Image.asset(ic_notification, height: 22, width: 22),
          onPressed: () {
            const NotificationScreen().launch(context);
          },
        ),
      ),
      body: AnimatedScrollView(
        padding: const EdgeInsets.only(bottom: 30),
        children: [
          buildTopWidget(),
          16.height,
          const TopArtistsComponent(radius: 16),
          16.height,
          buildFavoritesArtists(),
        ],
      ),
    );
  }
}
