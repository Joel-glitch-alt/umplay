import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/core/constants/sizes.dart';

import '../../../core/components/app_scaffold.dart';
import '../../../core/components/cached_image_widget.dart';
import '../../../core/components/common_app_button.dart';
import '../../../core/components/gradient_icon_widget.dart';
import '../../../core/components/icon_background_widget.dart';
import '../../../core/utils/common.dart';
import '../../../core/constants/constant.dart';
import '../../../core/constants/images.dart';
import 'model/artists_followed_list_model.dart';

class ArtistDetailScreen extends StatefulWidget {
  final ArtistsFollowedListModel? artistData;

  const ArtistDetailScreen({super.key, this.artistData});

  @override
  _ArtistDetailScreenState createState() => _ArtistDetailScreenState();
}

class _ArtistDetailScreenState extends State<ArtistDetailScreen> {
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
                url: widget.artistData!.artistImg.validate(),
                height: 130,
                width: context.width(),
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(1).expand(flex: 2),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Marquee(
                        child: Text(
                          widget.artistData!.artistName.validate(),
                          style: boldTextStyle(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ).expand(),
                      16.width,
                      const Icon(Icons.more_vert, size: 20).onTap(() {
                        //
                      }, borderRadius: radius(4.00)),
                    ],
                  ),
                  10.height,
                  ReadMoreText(
                      'Amet minim mollit non deserunt ullamco est sit....',
                      style: secondaryTextStyle()),
                  22.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Marquee(
                          child: Text(widget.artistData!.noOfLikes.validate(),
                              style: secondaryTextStyle())),
                      InkWell(
                        onTap: () {
                          widget.artistData!.isLike =
                              !widget.artistData!.isLike.validate();
                          setState(() {});
                        },
                        splashColor: Colors.transparent,
                        child: widget.artistData!.isLike.validate()
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
          16.height,
          CommonAppButton(
            onPressed: () {
              widget.artistData!.isFollow =
                  !widget.artistData!.isFollow.validate();
              setState(() {});
            },
            btnText:
                widget.artistData!.isFollow == true ? 'Following' : 'Follow',
            width: context.width() * 0.3,
            gradient: widget.artistData!.isFollow == true
                ? null
                : primaryHomeLinearGradient(
                    firstColor: Colors.grey, secondColor: Colors.grey),
            height: 35,
          ).paddingLeft(16),
          20.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedImageWidget(
                url: widget.artistData!.artistImg.validate(),
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
                          widget.artistData!.artistName.validate(),
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
                  ReadMoreText(
                      'Amet minim mollit non deserunt ullamco est sit....',
                      style: secondaryTextStyle()),
                  22.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Marquee(
                          child: Text(widget.artistData!.noOfLikes.validate(),
                              style: secondaryTextStyle())),
                      InkWell(
                        onTap: () {
                          widget.artistData!.isLike =
                              !widget.artistData!.isLike.validate();
                          setState(() {});
                        },
                        splashColor: Colors.transparent,
                        child: widget.artistData!.isLike.validate()
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
          16.height,
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
          20.height,
        ],
      ),
    );
  }
}
