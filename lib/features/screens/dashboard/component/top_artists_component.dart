import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/features/home/domain/entities/artist_entity.dart';
import 'package:umplay/features/home/presentation/controllers/artist_controller.dart';

import '../../../../core/components/cached_image_widget.dart';
import '../../../../core/components/view_all_label_component.dart';
import '../../library/artist_detail_screen.dart';
import '../../library/artists_followed_screen.dart';

class TopArtistsComponent extends StatelessWidget {
  const TopArtistsComponent({super.key, this.radius});
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArtistController());
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
        Obx(
          () => controller.isLoading.value
              ? const CircularProgressIndicator()
              : HorizontalList(
                  itemCount: controller.artists.length,
                  spacing: 16,
                  runSpacing: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    ArtistEntity artistsFollowedListData =
                        controller.artists[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                            () => ArtistDetailScreen(
                                  artistData: artistsFollowedListData,
                                ),
                            transition: Transition.upToDown);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedImageWidget(
                            url:
                                'https://source.unsplash.com/random/?artist,music',
                            height: 80,
                            fit: BoxFit.cover,
                            width: 80,
                            radius: radius ?? 100,
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
                ),
        )
      ],
    );
  }
}
