import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:umplay/core/constants/icon_constants.dart';
import 'package:umplay/core/constants/image_constants.dart';
import 'package:umplay/core/utils/device/device_utils.dart';
import 'package:umplay/core/widgets/app_scaffold.dart';
import 'package:umplay/core/widgets/cached_image_widget.dart';
import 'package:umplay/core/widgets/common.dart';
import 'package:umplay/core/widgets/view_all_label_component.dart';
import 'package:umplay/features/home/presentation/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    List<String> artistList = [
      UImages.alanWalkerArtists,
      UImages.timDavidArtists,
      UImages.marshMelloArtists,
      UImages.akonArtists,
      UImages.arianaGrandeArtists,
    ];

    return AppScaffold(
      appBar: commonAppBarWidget(
        context,
        title: '',
        showBack: false,
        isCenter: false,
        titleWidget: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello there !'),
            Text(
              'Esther Howard',
            ),
          ],
        ),
        actionWidget1: IconButton(
          icon: Image.asset(icSearch, height: 22, width: 22),
          onPressed: () {},
        ),
        actionWidget2: IconButton(
          icon: Image.asset(icNotification, height: 22, width: 22),
          onPressed: () {},
        ),
      ),
      body: AnimatedScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        listAnimationType: ListAnimationType.FadeIn,
        fadeInConfiguration: FadeInConfiguration(
          duration: const Duration(seconds: 2),
        ),
        children: [
          6.height,
          ViewAllLabel(
            label: 'Popular Artists',
            onTap: () {
              // ArtistsFollowedScreen(
              //         appBarTitle: 'Popular Artists', hideActionWidget: false)
              //     .launch(context,
              //         pageRouteAnimation: PageRouteAnimation.Slide);
            },
          ).paddingSymmetric(horizontal: 16),
        ],
      ),
    );
  }
}
