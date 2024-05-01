import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/components/app_scaffold.dart';
import '../../../core/utils/common.dart';
import '../../../core/constants/images.dart';
import 'component/download_episodes_list_screen.dart';

class DownloadEpisodesScreen extends StatefulWidget {
  const DownloadEpisodesScreen({super.key});

  @override
  _DownloadEpisodesScreenState createState() => _DownloadEpisodesScreenState();
}

class _DownloadEpisodesScreenState extends State<DownloadEpisodesScreen> {
  List<String> episodesChipList = [
    'Downloaded',
    'Saved',
    'Unplayed',
    'Continue Listening'
  ];

  String selectedEpisodesChipText = '';

  int selectedEpisodesChipIndex = 0;

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
        title: 'Downloaded Episodes',
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
            itemCount: episodesChipList.length,
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  selectedEpisodesChipIndex = index;
                  if (index == selectedEpisodesChipIndex) {
                    selectedEpisodesChipText = episodesChipList[index];
                  }
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: boxDecorationDefault(
                    borderRadius: radius(20),
                    color: index == selectedEpisodesChipIndex
                        ? Colors.grey.withAlpha(80)
                        : Colors.grey.withAlpha(25),
                    gradient: index == selectedEpisodesChipIndex
                        ? primaryHomeLinearGradient()
                        : null,
                    boxShadow: defaultBoxShadow(
                        blurRadius: 0, shadowColor: Colors.black.withAlpha(20)),
                  ),
                  child: Text(episodesChipList[index],
                      style: primaryTextStyle(
                          size: 14, color: textPrimaryColorGlobal)),
                ),
              );
            },
          ),
          22.height,
          if (selectedEpisodesChipIndex == 0 ||
              selectedEpisodesChipText == 'Downloaded')
            const DownloadEpisodesListScreen(),
          if (selectedEpisodesChipText == 'Saved') const DownloadEpisodesListScreen(),
          if (selectedEpisodesChipText == 'Unplayed')
            const DownloadEpisodesListScreen(),
          if (selectedEpisodesChipText == 'Continue Listening')
            const DownloadEpisodesListScreen(),
        ],
      ),
    );
  }
}
