import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/core/constants/sizes.dart';

import '../../../../core/components/cached_image_widget.dart';
import '../../../../core/components/view_all_label_component.dart';
import '../../../../core/constants/constant.dart';
import '../model/search_data_model.dart';

class TopSearchComponent extends StatefulWidget {
  const TopSearchComponent({super.key});

  @override
  _TopSearchComponentState createState() => _TopSearchComponentState();
}

class _TopSearchComponentState extends State<TopSearchComponent> {
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
    return AnimatedScrollView(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingItemWidget(
          title: getTopSearchList.titleName.validate(),
          titleTextStyle: boldTextStyle(color: textPrimaryColorGlobal),
          subTitle: getTopSearchList.subTitleName.validate(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          leading: CachedImageWidget(
              url: getTopSearchList.img.validate(),
              height: 55,
              fit: BoxFit.cover,
              width: 55,
              radius: 80),
        ),
        const ViewAllLabel(label: 'Albums', isShowAll: false)
            .paddingSymmetric(horizontal: 16),
        16.height,
        HorizontalList(
          spacing: 16,
          runSpacing: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: getTopSearchList.albums.validate().length,
          itemBuilder: (context, index) {
            SearchDataModel albumsListData =
                getTopSearchList.albums.validate()[index];
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
                    url: albumsListData.img.validate(),
                    height: 90,
                    width: context.width(),
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRect(18).paddingAll(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Marquee(
                          child: Text(albumsListData.titleName.validate(),
                              style: primaryTextStyle())),
                      6.height,
                      Marquee(
                          child: Text(albumsListData.subTitleName.validate(),
                              style: secondaryTextStyle())),
                    ],
                  ).paddingAll(10),
                ],
              ),
            );
          },
        ),
        30.height,
        Wrap(
          runSpacing: 16,
          children:
              List.generate(getTopSearchList.data.validate().length, (index) {
            SearchDataModel searchDataList =
                getTopSearchList.data.validate()[index];
            return SettingItemWidget(
              title: searchDataList.titleName.validate(),
              subTitle: searchDataList.subTitleName.validate(),
              padding: const EdgeInsets.only(bottom: 16),
              leading: CachedImageWidget(
                url: searchDataList.img.validate(),
                height: 60,
                width: 60,
                fit: BoxFit.cover,
                radius: searchDataList.subTitleName == 'Artist' ? 80 : 8,
              ).cornerRadiusWithClipRRect(10),
              trailing: searchDataList.subTitleName == 'Song'
                  ? Icon(Icons.more_vert, color: textPrimaryColorGlobal).onTap(
                      () {
                      //
                    }, borderRadius: radius(USizes.defaultRadius))
                  : const Offstage(),
            );
          }),
        ).paddingSymmetric(horizontal: 16),
      ],
    );
  }
}
