import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/core/components/gradient_icon_widget.dart';

import '../../../../core/components/cached_image_widget.dart';
import '../../../../core/constants/images.dart';

class MyArtistComponent extends StatefulWidget {
  const MyArtistComponent({super.key});

  @override
  _MyArtistComponentState createState() => _MyArtistComponentState();
}

class _MyArtistComponentState extends State<MyArtistComponent> {
  PageController sliderPageController = PageController(initialPage: 0);

  List<String> sliderImgList = [img_slider, img_slider, img_slider];

  @override
  void initState() {
    super.initState();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    sliderPageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLike = true;
    bool isFollow = true;
    return SizedBox(
      height: 280,
      width: context.width(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedImageWidget(
            url: img_slider2,
            height: 225,
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
                      "Mani",
                      style: boldTextStyle(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ).expand(),
                  16.width,
                  const Icon(Icons.more_vert, size: 20).onTap(() {
                    //
                  }, borderRadius: radius(16.00)),
                ],
              ),
              10.height,
              ReadMoreText('Amet minim mollit non deserunt ullamco est sit....',
                  style: secondaryTextStyle()),
              22.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Marquee(child: Text('300', style: secondaryTextStyle())),
                  InkWell(
                    onTap: () {
                      isLike = !isLike;
                      setState(() {});
                    },
                    splashColor: Colors.transparent,
                    child: isFollow
                        ? const GradientIconWidget(icon: Icons.favorite)
                        : const Icon(Icons.favorite, size: 24, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ).expand(flex: 3),

          // Positioned(
          //   bottom: 45,
          //   left: 0,
          //   right: 0,
          //   child: SettingItemWidget(
          //     title: 'Counting Stars',
          //     padding: EdgeInsets.only(left: 22, bottom: 20),
          //     titleTextStyle: boldTextStyle(),
          //     subTitle: 'OneRepublic',
          //     subTitleTextStyle: secondaryTextStyle(),
          //   ),
          // )
        ],
      ),
    );
  }
}
