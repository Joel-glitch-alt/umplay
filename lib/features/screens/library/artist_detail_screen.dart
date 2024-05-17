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
      // backgroundColor:
      //     isDarkModeOn ? UColors.primaryBackground : UColors.primaryBackground,
      // body: NestedScrollView(
      //   floatHeaderSlivers: true,
      //   physics: const NeverScrollableScrollPhysics(),
      //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      //     return [
      //       SliverAppBar(
      //         // backgroundColor: isDarkModeOn
      //         //     ? UColors.primaryBackground
      //         //     : UColors.primaryBackground,
      //         leading: IconButton(
      //           icon: const Icon(Icons.arrow_back, color: UColors.primaryColor),
      //           onPressed: () {
      //             finish(context);
      //           },
      //         ).visible(innerBoxIsScrolled),

      //         leadingWidth: 30,
      //         pinned: true,
      //         elevation: 0.5,
      //         expandedHeight: 300,
      //         flexibleSpace: FlexibleSpaceBar(
      //           titlePadding:
      //               const EdgeInsets.only(bottom: 66, left: 30, right: 50),
      //           collapseMode: CollapseMode.parallax,
      //           background: Column(
      //             children: [
      //               Stack(
      //                 children: [
      //                   CachedImageWidget(
      //                     url:
      //                         'https://source.unsplash.com/random/?artist,music',
      //                     height: 300,
      //                     fit: BoxFit.cover,
      //                     width: context.width(),
      //                     // radius: USizes.defaultRadius ?? 100,
      //                   ),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Container(
      //                         decoration: BoxDecoration(
      //                           borderRadius: radius(100),
      //                           color: context.cardColor,
      //                         ),
      //                         padding: const EdgeInsets.all(8),
      //                         margin: const EdgeInsets.only(left: 16, top: 30),
      //                         child: Icon(Icons.arrow_back,
      //                             color: UColors.primaryColor),
      //                       ).onTap(() {
      //                         finish(context);
      //                       }, borderRadius: radius(100)),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ];
      //   },
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://images.unsplash.com/photo-1589996448606-27d38c70f3bc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGFydGlzdHN8ZW58MHx8MHx8fDA%3D',
                fit: BoxFit.cover,
              ),
            ),
            pinned: true,
            leading: const Icon(Icons.arrow_back, color: Colors.black),
            actions: <Widget>[
              Icon(Icons.settings, color: Colors.black),
            ],
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _RedContainer(
              minHeight: 0,
              maxHeight: 1000,
            ),
          ),
        ],
      ),
    );
  }
}

class _RedContainer extends SliverPersistentHeaderDelegate {
  _RedContainer({
    required this.minHeight,
    required this.maxHeight,
  });

  final double minHeight;
  final double maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // Calculate the top padding based on the shrinkOffset
    final double topPadding = 20 - shrinkOffset / 2;

    return Container(
      padding: EdgeInsets.only(top: topPadding),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 41, 27, 129),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Michael Jackson',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                const SizedBox(
                  width: 70,
                ),
                ElevatedButton(onPressed: () {}, child: Text('Follow'))
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "uvbbaguhghubbhbvbabgbarhgbbhnignjds n jnfnn dsfinfjNNNFN fgjyjy fbbbqfefefgvagrgrgre re ragr gagragrtg5 y5wy5wyrtghty jys",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Top Songs",
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              2,
              (index) => _buildVideoPlayerWithPlayButton(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButtonWithOverlay({
    required IconData icon,
    required Color color,
  }) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            // Add your onPressed logic here
          },
          color: Colors.green,
        ),
        Container(
          color: Colors.black.withOpacity(0.6),
        ),
      ],
    );
  }

  // Widget _buildVideoPlayerWithPlayButton() {
  //   return GestureDetector(
  //     onTap: () {
  //       // Add your onTap logic here
  //       print("object");
  //     },
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Container(
  //         width: 80,
  //         height: 80,
  //         // margin: EdgeInsets.symmetric(vertical: 8),
  //         decoration: BoxDecoration(
  //           color: Colors.black,
  //           borderRadius: BorderRadius.circular(8),
  //         ),
  //         child: const Icon(
  //           Icons.play_arrow,
  //           size: 40,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Widget _buildVideoPlayerWithPlayButton() {
    return GestureDetector(
      onTap: () {
        // Add your onTap logic here
        print("object");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.play_arrow,
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            const Column(
              //crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Video Title',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.visibility, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      '100 views',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.thumb_up, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      '50 likes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
