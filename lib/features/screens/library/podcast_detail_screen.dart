import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/core/constants/sizes.dart';

import '../../../core/components/app_scaffold.dart';
import '../../../core/components/cached_image_widget.dart';
import '../../../core/components/common_app_divider.dart';
import '../../../core/components/view_all_label_component.dart';
import '../../../core/utils/common.dart';
import '../../../core/constants/constant.dart';
import '../../../core/constants/images.dart';
import '../download/component/download_item_widget.dart';
import '../download/model/download_list_model.dart';
import '../search/model/search_data_model.dart';

class PodcastDetailScreen extends StatefulWidget {
  final SearchDataModel? podCastListData;

  const PodcastDetailScreen({super.key, this.podCastListData});

  @override
  _PodcastDetailScreenState createState() => _PodcastDetailScreenState();
}

class _PodcastDetailScreenState extends State<PodcastDetailScreen> {
  List<DownloadSongListModel> episodeListData = getDownloadedEpisodesList();

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
      appBar: commonAppBarWidget(context),
      body: AnimatedScrollView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedImageWidget(
                url: widget.podCastListData!.img.validate(),
                height: 130,
                width: context.width(),
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(18).expand(flex: 2),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Marquee(
                        child: Text(
                          widget.podCastListData!.titleName.validate(),
                          style: boldTextStyle(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ).expand(),
                      16.width,
                      const Icon(Icons.more_vert, size: 20).onTap(() {
                        //
                      }, borderRadius: radius(USizes.defaultRadius)),
                    ],
                  ),
                  10.height,
                  Marquee(
                      child: Text(
                          widget.podCastListData!.subTitleName.validate(),
                          style: secondaryTextStyle())),
                  10.height,
                  Marquee(
                      child: Text(widget.podCastListData!.followers.validate(),
                          style: secondaryTextStyle())),
                  22.height,
                  Row(
                    children: [
                      Marquee(
                          child: Text(widget.podCastListData!.rate.validate(),
                              style: secondaryTextStyle())),
                      8.width,
                      Image.asset(ic_star, height: 16, width: 16),
                    ],
                  ),
                ],
              ).expand(flex: 3),
            ],
          ).paddingSymmetric(horizontal: 16),
          30.height,
          ReadMoreText(
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit......',
            style: secondaryTextStyle(),
          ).paddingSymmetric(horizontal: 16),
          20.height,
          const ViewAllLabel(label: 'All Episodes', isShowAll: false)
              .paddingSymmetric(horizontal: 16),
          ListView.separated(
            separatorBuilder: (context, index) =>
                const CommonAppDividerWidget(height: 30),
            itemCount: episodeListData.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              DownloadSongListModel data = episodeListData[index];
              return DownloadItemWidget(modObj: data, isPodcastDetail: true);
            },
          ),
        ],
      ),
    );
  }
}
