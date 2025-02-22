import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/components/app_scaffold.dart';
import '../../../../core/components/cached_image_widget.dart';
import '../../../../core/utils/common.dart';
import '../../../../core/constants/images.dart';
import '../../notification/notification_screen.dart';
import '../../search/search_screen.dart';
import '../component/favourite_music_component.dart';
import '../component/fan_base_trending_videos_component.dart';

class MusicFragment extends StatefulWidget {
  const MusicFragment({super.key});

  @override
  _MusicFragmentState createState() => _MusicFragmentState();
}

class _MusicFragmentState extends State<MusicFragment> {
  List<String> musicChipList = ['POP', 'JAZZ', 'ROCK', 'CHILL VIBES', 'LO-FI'];

  String selectedMusicChipText = '';

  int selectedMusicChipIndex = -1;

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

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: commonAppBarWidget(
        context,
        title: 'Music',
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
          HorizontalList(
            itemCount: musicChipList.length,
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  selectedMusicChipIndex = index;
                  if (index == selectedMusicChipIndex) {
                    selectedMusicChipText = musicChipList[index];
                  }
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: boxDecorationDefault(
                    borderRadius: radius(20),
                    color: index == selectedMusicChipIndex
                        ? Colors.grey.withAlpha(80)
                        : Colors.grey.withAlpha(25),
                    gradient: index == selectedMusicChipIndex
                        ? primaryHomeLinearGradient()
                        : null,
                    boxShadow: defaultBoxShadow(
                        blurRadius: 0, shadowColor: Colors.black.withAlpha(20)),
                  ),
                  child: Text(musicChipList[index],
                      style: primaryTextStyle(
                          size: 14, color: textPrimaryColorGlobal)),
                ),
              );
            },
          ),
          16.height,
          Container(
            width: context.width(),
            height: 225,
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
                  url: img_slider2,
                  height: 225,
                  width: context.width(),
                  fit: BoxFit.cover,
                ).cornerRadiusWithClipRRect(18).paddingAll(6),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SettingItemWidget(
                    title: 'Counting Stars',
                    padding: const EdgeInsets.only(left: 22, bottom: 20),
                    titleTextStyle: boldTextStyle(),
                    subTitle: 'OneRepublic',
                    subTitleTextStyle: secondaryTextStyle(),
                  ),
                )
              ],
            ),
          ),
          16.height,
          const FavouriteMusicComponent(),
          16.height,
          const FanBaseTrendingVideosComponent(),
        ],
      ),
    );
  }
}
