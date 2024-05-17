import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/core/components/cached_image_widget.dart';
import 'package:umplay/core/components/common_app_divider.dart';
import 'package:umplay/core/components/sticky_headers/widget.dart';
import 'package:umplay/core/constants/colors_constants.dart';
import 'package:umplay/core/constants/sizes.dart';
import 'package:umplay/features/contestants/presentation/controllers/contestants_controller.dart';
import 'package:umplay/features/home/data/models/artist_model.dart';
import 'package:umplay/features/screens/download/component/download_item_widget.dart';

import '../../../../core/components/app_scaffold.dart';
import '../../../../core/utils/common.dart';
import '../../../../core/constants/images.dart';
import '../../../screens/notification/notification_screen.dart';
import '../../../screens/search/search_screen.dart';
import 'package:get/get.dart';

class ContestantsFragment extends StatelessWidget {
  const ContestantsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContestantsController());
    return AppScaffold(
      appBar: commonAppBarWidget(
        context,
        title: 'Contestants',
        showBack: false,
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
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  return StickyHeader(
                    header: Container(
                      height: 50.0,
                      color: Colors.blueGrey[700],
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.artistsByRegions[index].name!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    content: ListView.separated(
                      itemCount:
                          controller.artistsByRegions[index].artistes!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      separatorBuilder: (context, index) =>
                          const CommonAppDividerWidget(height: 30),
                      itemBuilder: (ctx, idx) {
                        final data =
                            controller.artistsByRegions[index].artistes![idx];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    data.fullName?.validate() ?? '',
                                    style: secondaryTextStyle(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Column(
                                  children: [
                                    const CachedImageWidget(
                                      url:
                                          'https://source.unsplash.com/random/?artist,music',
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.cover,
                                    ).cornerRadiusWithClipRRect(12),
                                  ],
                                ),
                                16.width,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    4.height,
                                    Text(
                                      data.fullName?.validate() ?? '',
                                      style: boldTextStyle(
                                          color: UColors.textWhite),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ).paddingRight(16),
                                    8.height, // RichTextWidget(
                                    //   list: [
                                    //     TextSpan(
                                    //         text:data!.itemName.validate(),
                                    //         style: secondaryTextStyle()),
                                    //     if (widget.modObj!.itemName.validate().isNotEmpty)
                                    //       TextSpan(text: ' | ', style: secondaryTextStyle()),
                                    //     TextSpan(
                                    //         text:data!.itemType.validate(),
                                    //         style: secondaryTextStyle()),
                                    //   ],
                                    // ),
                                  ],
                                ).expand(),
                              ],
                            ),
                            8.height,
                          ],
                        );
                      },
                    ),
                  );
                },
                itemCount: controller.artistsByRegions.length,
              ),
      ),
    );
  }
}
