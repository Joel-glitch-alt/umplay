import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/core/constants/sizes.dart';

import '../../../core/components/app_scaffold.dart';
import '../../../core/components/cached_image_widget.dart';
import '../../../core/components/gradient_icon_widget.dart';
import '../../../core/components/icon_background_widget.dart';
import '../../../core/utils/common.dart';
import '../../../core/constants/constant.dart';
import '../../../core/constants/images.dart';
import '../search/component/songs_search_component.dart';
import '../search/model/search_data_model.dart';

class PlaylistDetailScreen extends StatefulWidget {
  final SearchDataModel? playListData;

  const PlaylistDetailScreen({super.key, this.playListData});

  @override
  _PlaylistDetailScreenState createState() => _PlaylistDetailScreenState();
}

class _PlaylistDetailScreenState extends State<PlaylistDetailScreen> {
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
                url: widget.playListData!.img.validate(),
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
                          widget.playListData!.titleName.validate(),
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
                  Row(
                    children: [
                      const CachedImageWidget(
                        url: app_logo,
                        height: 30,
                        fit: BoxFit.cover,
                        width: 30,
                        radius: 80,
                      ),
                      8.width,
                      Marquee(
                          child:
                              Text('Relix', style: primaryTextStyle(size: 14))),
                    ],
                  ),
                  22.height,
                  Marquee(
                      child: Text(
                          '${widget.playListData!.type.validate()} | ${widget.playListData!.playlistTime.validate()}',
                          style: secondaryTextStyle())),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Marquee(
                          child: Text(widget.playListData!.noOfLikes.validate(),
                              style: secondaryTextStyle())),
                      InkWell(
                        onTap: () {
                          widget.playListData!.isLike =
                              !widget.playListData!.isLike.validate();
                          setState(() {});
                        },
                        splashColor: Colors.transparent,
                        child: widget.playListData!.isLike.validate()
                            ? const GradientIconWidget(icon: Icons.favorite)
                            : const Icon(Icons.favorite,
                                size: 24, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ).expand(flex: 3),
            ],
          ).paddingSymmetric(horizontal: 16),
          30.height,
          ReadMoreText(
                  'Amet minim mollit non deserunt ullamco est sit aliqua dolor.',
                  style: secondaryTextStyle())
              .paddingSymmetric(horizontal: 16),
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Image.asset(ic_playlist, height: 22, width: 22),
                padding: EdgeInsets.zero,
                onPressed: () {
                  //
                },
              ),
              12.width,
              IconButton(
                icon: const IconBackgroundWidget(
                    icon: ic_add,
                    color: Colors.white,
                    boxHeight: 22,
                    boxWidth: 22,
                    padding: 6),
                padding: EdgeInsets.zero,
                onPressed: () {
                  //
                },
              ),
              12.width,
              IconButton(
                icon: IconBackgroundWidget(
                    icon: ic_play,
                    color: Colors.grey.withAlpha(25),
                    padding: 6,
                    height: 30,
                    width: 30),
                padding: EdgeInsets.zero,
                onPressed: () {
                  //
                },
              ),
              12.width,
              IconButton(
                icon: Image.asset(ic_shuffle, height: 22, width: 22),
                padding: EdgeInsets.zero,
                onPressed: () {
                  //
                },
              ),
              12.width,
              IconButton(
                icon: Image.asset(ic_share, height: 22, width: 22),
                padding: EdgeInsets.zero,
                onPressed: () {
                  //
                },
              ),
            ],
          ),
          SongsSearchComponent(),
        ],
      ),
    );
  }
}
