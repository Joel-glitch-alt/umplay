import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/features/screens/dashboard/component/top_artists_component.dart';

import '../../../../core/components/app_scaffold.dart';
import '../../../../core/components/cached_image_widget.dart';
import '../../../../core/components/view_all_label_component.dart';
import '../../../../core/utils/common.dart';
import '../../../../core/constants/images.dart';
import '../../notification/notification_screen.dart';
import '../../search/search_screen.dart';
import '../model/dashboard_data_model.dart';

class PodcastsFragment extends StatefulWidget {
  const PodcastsFragment({super.key});

  @override
  _PodcastsFragmentState createState() => _PodcastsFragmentState();
}

class _PodcastsFragmentState extends State<PodcastsFragment> {
  List<DashBoardDataModel> popularPodcastsList = getPopularPodcastsList();
  List<DashBoardDataModel> topPodcastsList = getTopPodcastsList();

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

  Widget buildPopularPodcastWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ViewAllLabel(label: 'Popular Podcasts', isShowAll: false),
        16.height,
        AnimatedWrap(
          spacing: 16,
          runSpacing: 16,
          itemCount: 4,
          crossAxisAlignment: WrapCrossAlignment.start,
          itemBuilder: (ctx, index) {
            DashBoardDataModel popularPodCastsDataList =
                popularPodcastsList[index];
            return Container(
              width: context.width() / 2 - 24,
              padding: const EdgeInsets.all(8),
              decoration: boxDecorationDefault(
                color: Colors.grey.withAlpha(25),
                borderRadius: radius(18),
                boxShadow: defaultBoxShadow(
                    blurRadius: 0,
                    shadowColor: Colors.black.withAlpha(20),
                    spreadRadius: 0),
              ),
              child: Container(
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
                      url: popularPodCastsDataList.img.validate(),
                      height: 130,
                      width: context.width(),
                      fit: BoxFit.cover,
                    ).cornerRadiusWithClipRRectOnly(topLeft: 18, topRight: 18),
                    RichTextWidget(
                      maxLines: 2,
                      list: [
                        TextSpan(
                          text: '${popularPodCastsDataList.podcastsTitle
                                  .splitBefore(':')} : ',
                          style: primaryTextStyle(size: 12),
                        ),
                        TextSpan(
                          text: popularPodCastsDataList.podcastsTitle
                              .splitAfter(':'),
                          style: secondaryTextStyle(size: 12, height: 1.5),
                        ),
                      ],
                    ).paddingAll(12),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ).paddingSymmetric(horizontal: 16);
  }

  Widget buildTopPodcastWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewAllLabel(
          label: 'Top Podcasts',
          onTap: () {
            //
          },
        ).paddingSymmetric(horizontal: 16),
        12.height,
        HorizontalList(
          spacing: 16,
          runSpacing: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: topPodcastsList.length,
          itemBuilder: (context, index) {
            DashBoardDataModel topPodcastsListData = topPodcastsList[index];
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
                    url: topPodcastsListData.img.validate(),
                    height: 100,
                    width: context.width(),
                    fit: BoxFit.fill,
                  ).cornerRadiusWithClipRRect(18).paddingAll(10),
                  Marquee(
                          child: Text(
                              topPodcastsListData.podcastsTitle.validate(),
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
        title: 'Podcasts',
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
          buildPopularPodcastWidget(),
          16.height,
          const TopArtistsComponent(),
          16.height,
          buildTopPodcastWidget(),
        ],
      ),
    );
  }
}
