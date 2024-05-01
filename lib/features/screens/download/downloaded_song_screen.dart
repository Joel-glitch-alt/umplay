import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/components/app_scaffold.dart';
import '../../../core/utils/common.dart';
import '../../../core/constants/images.dart';
import 'component/download_song_list_screen.dart';

class DownloadedSongListScreen extends StatefulWidget {
  const DownloadedSongListScreen({super.key});

  @override
  _DownloadedSongListScreenState createState() =>
      _DownloadedSongListScreenState();
}

class _DownloadedSongListScreenState extends State<DownloadedSongListScreen> {
  List<String> songChipList = [
    'Downloaded',
    'Saved',
    'Unplayed',
    'Continue Listening'
  ];

  String selectedSongChipText = '';

  int selectedSongChipIndex = 0;

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
      appBar: commonAppBarWidget(
        context,
        title: 'Downloaded Song',
        actionWidget1: IconButton(
          icon: Image.asset(ic_sort_arrow,
              height: 22, width: 22, color: Colors.white),
          onPressed: () {
            //
          },
        ),
      ),
      body: AnimatedScrollView(
        padding: const EdgeInsets.only(bottom: 30),
        physics: const AlwaysScrollableScrollPhysics(),
        listAnimationType: ListAnimationType.Slide,
        fadeInConfiguration: FadeInConfiguration(duration: 2.seconds),
        children: [
          HorizontalList(
            itemCount: songChipList.length,
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  selectedSongChipIndex = index;
                  if (index == selectedSongChipIndex) {
                    selectedSongChipText = songChipList[index];
                  }
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: boxDecorationDefault(
                    borderRadius: radius(20),
                    color: index == selectedSongChipIndex
                        ? Colors.grey.withAlpha(80)
                        : Colors.grey.withAlpha(25),
                    gradient: index == selectedSongChipIndex
                        ? primaryHomeLinearGradient()
                        : null,
                    boxShadow: defaultBoxShadow(
                        blurRadius: 0, shadowColor: Colors.black.withAlpha(20)),
                  ),
                  child: Text(songChipList[index],
                      style: primaryTextStyle(
                          size: 14, color: textPrimaryColorGlobal)),
                ),
              );
            },
          ),
          22.height,
          if (selectedSongChipIndex == 0 ||
              selectedSongChipText == 'Downloaded')
            const DownloadSongListComponent(),
          if (selectedSongChipText == 'Saved') const DownloadSongListComponent(),
          if (selectedSongChipText == 'Unplayed') const DownloadSongListComponent(),
          if (selectedSongChipText == 'Continue Listening')
            const DownloadSongListComponent(),
        ],
      ),
    );
  }
}
