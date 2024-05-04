import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/features/home/domain/entities/artist_entity.dart';
import 'package:umplay/features/home/presentation/controllers/artist_controller.dart';

import '../../../../core/components/cached_image_widget.dart';
import '../../../../core/components/view_all_label_component.dart';
import '../../library/artist_detail_screen.dart';
import '../../library/artists_followed_screen.dart';
import '../../library/model/artists_followed_list_model.dart';

class TopArtistsComponent extends StatefulWidget {
  final double? radius;

  const TopArtistsComponent({super.key, this.radius});

  @override
  _TopArtistsComponentState createState() => _TopArtistsComponentState();
}

class _TopArtistsComponentState extends State<TopArtistsComponent> {
  List<ArtistsFollowedListModel> artistsFollowedList = getArtistsFollowedList();
  final controller = Get.find<ArtistController>();

  @override
  void initState() {
    super.initState();
    init();
    controller.getAllArtists(null);
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
          label: 'Top Artists',
          onTap: () {
            Get.to(
                () => const ArtistsFollowedScreen(
                      appBarTitle: 'Artists',
                      hideActionWidget: false,
                    ),
                transition: Transition.circularReveal);
          },
        ).paddingSymmetric(horizontal: 16),
        12.height,
        HorizontalList(
          itemCount: controller.artists.length,
          spacing: 16,
          runSpacing: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            ArtistEntity artistsFollowedListData =
                controller.artists.value[index];
            return GestureDetector(
              onTap: () {
                ArtistDetailScreen(artistData: artistsFollowedListData).launch(
                    context,
                    pageRouteAnimation: PageRouteAnimation.Slide);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedImageWidget(
                    url: 'https://source.unsplash.com/random/?artist,music',
                    height: 80,
                    fit: BoxFit.cover,
                    width: 80,
                    radius: widget.radius ?? 100,
                  ),
                  SizedBox(
                    width: 78,
                    child: Marquee(
                      child: Text(
                        artistsFollowedListData.fullName
                            .capitalizeFirstLetter(),
                        style: primaryTextStyle(
                            size: 14, color: textPrimaryColorGlobal),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ).center(),
                  ).paddingTop(8)
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
