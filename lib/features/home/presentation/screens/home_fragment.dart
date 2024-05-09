import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/components/app_scaffold.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/utils/common.dart';
import '../../../screens/dashboard/component/fan_base_trending_videos_component.dart';
import '../../../screens/dashboard/component/my_artist.dart';
import '../../../screens/dashboard/component/top_artists_component.dart';
import '../../../screens/notification/notification_screen.dart';
import '../../../screens/search/search_screen.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: commonAppBarWidget(
        context,
        title: '',
        showBack: false,
        isCenter: false,
        titleWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Evening  🌙', style: secondaryTextStyle()),
            10.height,
            Text('Esther Howard',
                style: primaryTextStyle(color: textPrimaryColorGlobal)),
          ],
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
        physics: const AlwaysScrollableScrollPhysics(),
        listAnimationType: ListAnimationType.FadeIn,
        fadeInConfiguration:
            FadeInConfiguration(duration: Duration(seconds: 2)),
        children: [
          6.height,
          const MyArtistComponent(),
          16.height,
          const TopArtistsComponent(),
          16.height,
          const FanBaseTrendingVideosComponent(),
          16.height,
        ],
      ),
    );
  }
}
