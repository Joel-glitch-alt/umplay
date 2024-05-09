import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/core/components/cached_image_widget.dart';
import 'package:umplay/core/constants/colors_constants.dart';
import 'package:umplay/core/constants/image_constants.dart';
import 'package:umplay/core/constants/sizes.dart';
import 'package:umplay/core/utils/device/device_utils.dart';
import 'package:umplay/features/home/domain/entities/artist_entity.dart';

class ArtistDetailScreen extends StatelessWidget {
  final ArtistEntity? artistData;

  const ArtistDetailScreen({super.key, this.artistData});

  @override
  Widget build(BuildContext context) {
    final isDarkModeOn = UDeviceUtils.isDarkMode(context);
    return Scaffold(
      backgroundColor:
          isDarkModeOn ? UColors.primaryBackground : UColors.primaryBackground,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: isDarkModeOn
                  ? UColors.primaryBackground
                  : UColors.primaryBackground,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: UColors.primaryColor),
                onPressed: () {
                  finish(context);
                },
              ).visible(innerBoxIsScrolled),
              title: artistData!.fullName!.text(),
              actions: [
                IconButton(
                  icon: const Icon(Icons.subdirectory_arrow_right,
                      color: UColors.primaryColor),
                  onPressed: () {},
                ).visible(innerBoxIsScrolled),
                IconButton(
                  icon: true
                      ? const Icon(Icons.favorite, color: UColors.primaryColor)
                      : Icon(Icons.favorite_outline,
                          color: UColors.primaryColor),
                  onPressed: () {},
                ).visible(innerBoxIsScrolled),
              ],
              leadingWidth: 30,
              pinned: true,
              elevation: 0.5,
              expandedHeight: 450,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding:
                    const EdgeInsets.only(bottom: 66, left: 30, right: 50),
                collapseMode: CollapseMode.parallax,
                background: Column(
                  children: [
                    Stack(
                      children: [
                        CachedImageWidget(
                          url:
                              'https://source.unsplash.com/random/?artist,music',
                          height: 300,
                          fit: BoxFit.cover,
                          width: context.width(),
                          radius: USizes.defaultRadius ?? 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: radius(100),
                                color: context.cardColor,
                              ),
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(left: 16, top: 30),
                              child: Icon(Icons.arrow_back,
                                  color: UColors.primaryColor),
                            ).onTap(() {
                              finish(context);
                            }, borderRadius: radius(100)),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: radius(100),
                                    color: context.cardColor,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  margin:
                                      const EdgeInsets.only(right: 16, top: 30),
                                  child: Icon(Icons.subdirectory_arrow_right,
                                      color: UColors.primaryColor),
                                ).onTap(() {}, borderRadius: radius(100)),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: radius(100),
                                    color: context.cardColor,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  margin:
                                      const EdgeInsets.only(right: 16, top: 30),
                                  child: true
                                      ? Icon(Icons.favorite,
                                          color: UColors.primaryColor)
                                      : Icon(Icons.favorite_outline,
                                          color: UColors.textPrimary),
                                ).onTap(() {}, borderRadius: radius(100)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: isDarkModeOn
                          ? UColors.primaryBackground!
                          : UColors.primaryBackground!,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(artistData!.email.toString()),
                          8.height,
                          Text(
                            artistData!.email.toString(),
                            style: secondaryTextStyle(
                                color: isDarkModeOn
                                    ? Colors.white
                                    : UColors.primaryColor,
                                size: 12),
                          ),
                          8.height,
                          Row(
                            children: [
                              Text(artistData!.totalLikes.toString(),
                                  style: boldTextStyle()),
                              2.width,
                              Icon(Icons.star,
                                  color: UColors.primaryColor, size: 16),
                              Text(artistData!.totalLikes.toString(),
                                  style: secondaryTextStyle(
                                      color: UColors.textPrimary)),
                            ],
                          ),
                          8.height,
                          Wrap(
                            spacing: 16,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: UColors.primaryColor),
                                  color: isDarkModeOn
                                      ? UColors.primaryBackground!
                                      : UColors.primaryBackground!,
                                  borderRadius: radius(32),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.call_outlined,
                                        color: UColors.primaryColor),
                                    4.width,
                                    Text('Call us',
                                        style: boldTextStyle(
                                            color: UColors.primaryColor)),
                                  ],
                                ),
                              ).onTap(() {}, borderRadius: radius(32)),
                              Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: UColors.primaryColor),
                                  color: isDarkModeOn
                                      ? UColors.primaryBackground!
                                      : UColors.primaryBackground!,
                                  borderRadius: radius(32),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                        UImages
                                            .arianaGrandeChristmasSongPlaylist,
                                        height: 20,
                                        color: UColors.primaryColor),
                                    8.width,
                                    Text('Send Message',
                                        style: boldTextStyle(
                                            color: UColors.primaryColor)),
                                  ],
                                ),
                              ).onTap(() {}),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(
            color: isDarkModeOn
                ? UColors.primaryBackground!
                : UColors.primaryBackground!,
            borderRadius: radiusOnly(topLeft: 32, topRight: 32),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                16.height,
                SizedBox(
                  height: 500,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return AppScaffold(
  //     appBar: commonAppBarWidget(context),
  //     body: AnimatedScrollView(
  //       children: [
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             CachedImageWidget(
  //               url: 'https://source.unsplash.com/random/?artist',
  //               height: 130,
  //               width: context.width(),
  //               fit: BoxFit.cover,
  //             ).cornerRadiusWithClipRRect(1).expand(flex: 2),
  //             16.width,
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Marquee(
  //                       child: Text(
  //                         artistData!.fullName.validate(),
  //                         style: boldTextStyle(),
  //                         overflow: TextOverflow.ellipsis,
  //                         maxLines: 1,
  //                       ),
  //                     ).expand(),
  //                     16.width,
  //                     const Icon(Icons.more_vert, size: 20).onTap(() {
  //                       //
  //                     }, borderRadius: radius(4.00)),
  //                   ],
  //                 ),
  //                 10.height,
  //                 ReadMoreText(
  //                     'Amet minim mollit non deserunt ullamco est sit....',
  //                     style: secondaryTextStyle()),
  //                 22.height,
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Marquee(
  //                         child: Text(
  //                             artistData!.totalLikes.toString().validate(),
  //                             style: secondaryTextStyle())),
  //                     InkWell(
  //                       onTap: () {},
  //                       splashColor: Colors.transparent,
  //                       child: Random().nextBool() // TODO : Remove this
  //                           ? const GradientIconWidget(icon: Icons.favorite)
  //                           : const Icon(Icons.favorite,
  //                               size: 24, color: Colors.grey),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ).expand(flex: 3),
  //           ],
  //         ).paddingSymmetric(horizontal: 16),
  //         16.height,
  //         CommonAppButton(
  //           onPressed: () {
  //             // artistData!.isFollow =
  //             //     !artistData!.isFollow.validate();
  //             // setState(() {});
  //           },
  //           btnText: Random().nextBool() == true ? 'Following' : 'Follow',
  //           width: context.width() * 0.3,
  //           gradient: Random().nextBool()
  //               ? null
  //               : primaryHomeLinearGradient(
  //                   firstColor: Colors.grey, secondColor: Colors.grey),
  //           height: 35,
  //         ).paddingLeft(16),
  //         20.height,
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             CachedImageWidget(
  //               url: 'https://source.unsplash.com/random/?singer',
  //               height: 130,
  //               width: context.width(),
  //               fit: BoxFit.cover,
  //             ).cornerRadiusWithClipRRect(18).expand(flex: 2),
  //             16.width,
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Marquee(
  //                       child: Text(
  //                         artistData!.fullName.validate(),
  //                         style: boldTextStyle(),
  //                         overflow: TextOverflow.ellipsis,
  //                         maxLines: 1,
  //                       ),
  //                     ).expand(),
  //                     16.width,
  //                     const Icon(Icons.more_vert, size: 20).onTap(() {
  //                       //
  //                     }, borderRadius: radius(USizes.defaultRadius)),
  //                   ],
  //                 ),
  //                 10.height,
  //                 ReadMoreText(
  //                     'Amet minim mollit non deserunt ullamco est sit....',
  //                     style: secondaryTextStyle()),
  //                 22.height,
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Marquee(
  //                         child: Text(
  //                             artistData!.totalLikes.toString().validate(),
  //                             style: secondaryTextStyle())),
  //                     InkWell(
  //                       // onTap: () {
  //                       //   Random().nextBool() =
  //                       //       !widget.artistData!.isLike.validate();
  //                       //   setState(() {});
  //                       // },
  //                       splashColor: Colors.transparent,
  //                       child: artistData!.totalLikes
  //                                   .toString()
  //                                   .validate()
  //                                   .toInt() >
  //                               0
  //                           ? const GradientIconWidget(icon: Icons.favorite)
  //                           : const Icon(Icons.favorite,
  //                               size: 24, color: Colors.grey),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ).expand(flex: 3),
  //           ],
  //         ).paddingSymmetric(horizontal: 16),
  //         16.height,
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             IconButton(
  //               icon: Image.asset(ic_playlist, height: 22, width: 22),
  //               padding: EdgeInsets.zero,
  //               onPressed: () {
  //                 //
  //               },
  //             ),
  //             12.width,
  //             IconButton(
  //               icon: const IconBackgroundWidget(
  //                   icon: ic_add,
  //                   color: Colors.white,
  //                   boxHeight: 22,
  //                   boxWidth: 22,
  //                   padding: 6),
  //               padding: EdgeInsets.zero,
  //               onPressed: () {
  //                 //
  //               },
  //             ),
  //             12.width,
  //             IconButton(
  //               icon: IconBackgroundWidget(
  //                   icon: ic_play,
  //                   color: Colors.grey.withAlpha(25),
  //                   padding: 6,
  //                   height: 30,
  //                   width: 30),
  //               padding: EdgeInsets.zero,
  //               onPressed: () {
  //                 //
  //               },
  //             ),
  //             12.width,
  //             IconButton(
  //               icon: Image.asset(ic_shuffle, height: 22, width: 22),
  //               padding: EdgeInsets.zero,
  //               onPressed: () {
  //                 //
  //               },
  //             ),
  //             12.width,
  //             IconButton(
  //               icon: Image.asset(ic_share, height: 22, width: 22),
  //               padding: EdgeInsets.zero,
  //               onPressed: () {
  //                 //
  //               },
  //             ),
  //           ],
  //         ),
  //         20.height,
  //       ],
  //     ),
  //   );
  // }
}
