import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/core/constants/sizes.dart';

import '../../../../core/components/app_scaffold.dart';
import '../../../../core/components/cached_image_widget.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/common.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/constants/images.dart';
import '../../download/download_episodes_screen.dart';
import '../../download/downloaded_song_screen.dart';
import '../../library/component/artists_followed_component.dart';
import '../../library/component/podcast_followed_component.dart';
import '../../notification/notification_screen.dart';
import '../../search/search_screen.dart';

class LibraryFragment extends StatefulWidget {
  const LibraryFragment({super.key});

  @override
  _LibraryFragmentState createState() => _LibraryFragmentState();
}

class _LibraryFragmentState extends State<LibraryFragment> {
  List<String> recentMusicImgList = [ariana_music, ariana_music];

  Color commonSplashColor = lightPurple.withOpacity(0.3);

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Music', style: secondaryTextStyle(size: 18))
            .paddingSymmetric(horizontal: 16),
        10.height,
        const ArtistsFollowedComponent(),
        10.height,
        SettingItemWidget(
          title: 'Playlists',
          titleTextStyle: primaryTextStyle(),
          padding: const EdgeInsets.all(16),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          splashColor: commonSplashColor,
          hoverColor: commonSplashColor,
          onTap: () {
            //
          },
        ),
        SettingItemWidget(
          title: 'Downloaded Songs',
          titleTextStyle: primaryTextStyle(),
          padding: const EdgeInsets.all(16),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          splashColor: commonSplashColor,
          hoverColor: commonSplashColor,
          onTap: () {
            const DownloadedSongListScreen()
                .launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
          },
        ),
        SettingItemWidget(
          title: 'Albums',
          titleTextStyle: primaryTextStyle(),
          padding: const EdgeInsets.all(16),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          splashColor: commonSplashColor,
          hoverColor: commonSplashColor,
          onTap: () {
            //
          },
        ),
      ],
    );
  }

  Widget buildMiddleWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Podcast', style: secondaryTextStyle(size: 18))
            .paddingSymmetric(horizontal: 16),
        10.height,
        PodcastFollowedComponent(),
        10.height,
        SettingItemWidget(
          title: 'Downloaded Episodes',
          titleTextStyle: primaryTextStyle(),
          padding: const EdgeInsets.all(16),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          splashColor: commonSplashColor,
          hoverColor: commonSplashColor,
          onTap: () {
            const DownloadEpisodesScreen()
                .launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
          },
        ),
        SettingItemWidget(
          title: 'New Episodes',
          titleTextStyle: primaryTextStyle(),
          padding: const EdgeInsets.all(16),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          splashColor: commonSplashColor,
          hoverColor: commonSplashColor,
          onTap: () {
            //
          },
        ),
      ],
    );
  }

  Widget buildBottomWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent', style: secondaryTextStyle(size: 18))
            .paddingSymmetric(horizontal: 16),
        16.height,
        Wrap(
          runSpacing: 16,
          children: List.generate(recentMusicImgList.length, (index) {
            return SettingItemWidget(
              title: 'Ariana',
              subTitle: 'Song',
              padding: EdgeInsets.zero,
              leading: CachedImageWidget(
                url: recentMusicImgList[index],
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(10),
              trailing: Icon(Icons.more_vert, color: textPrimaryColorGlobal)
                  .onTap(() {
                //
              }, borderRadius: radius(USizes.defaultRadius)),
            );
          }),
        ).paddingSymmetric(horizontal: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: commonAppBarWidget(
        context,
        title: '',
        showBack: false,
        isCenter: false,
        titleWidget: SettingItemWidget(
          title: 'Library',
          titleTextStyle: boldTextStyle(color: textPrimaryColorGlobal),
          padding: EdgeInsets.zero,
          leading: const CachedImageWidget(
            url: img_profile,
            height: 48,
            fit: BoxFit.cover,
            width: 48,
            radius: 100,
          ),
        ),
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
          8.height,
          buildTopWidget(),
          16.height,
          buildMiddleWidget(),
          16.height,
          buildBottomWidget(),
        ],
      ),
    );
  }
}
