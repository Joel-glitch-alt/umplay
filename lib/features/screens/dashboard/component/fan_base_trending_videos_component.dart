import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/components/cached_image_widget.dart';
import '../../../../core/components/view_all_label_component.dart';
import '../model/dashboard_data_model.dart';

class FanBaseTrendingVideosComponent extends StatefulWidget {
  const FanBaseTrendingVideosComponent({super.key});

  @override
  _FanBaseTrendingVideosComponentState createState() =>
      _FanBaseTrendingVideosComponentState();
}

class _FanBaseTrendingVideosComponentState
    extends State<FanBaseTrendingVideosComponent> {
  List<DashBoardDataModel> recentPlayedDataList = getRecentPlayedMusicList();

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewAllLabel(
          label: 'Fan Base Trending Videos',
          onTap: () {
            //
          },
        ).paddingSymmetric(horizontal: 16),
        12.height,
        HorizontalList(
          spacing: 16,
          runSpacing: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: recentPlayedDataList.length,
          itemBuilder: (context, index) {
            DashBoardDataModel recentPlayedData = recentPlayedDataList[index];
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
                    url: recentPlayedData.img.validate(),
                    height: 90,
                    width: context.width(),
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRect(18).paddingAll(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Marquee(
                          child: Text(recentPlayedData.trackTitle.validate(),
                              style: primaryTextStyle(
                                  color: textPrimaryColorGlobal))),
                      6.height,
                      Marquee(
                          child: Text(recentPlayedData.trackSubTitle.validate(),
                              style: secondaryTextStyle())),
                    ],
                  ).paddingAll(10),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
