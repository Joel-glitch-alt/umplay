import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/components/common_app_divider.dart';
import '../model/download_list_model.dart';
import 'download_item_widget.dart';

class DownloadSongListComponent extends StatefulWidget {
  const DownloadSongListComponent({super.key});

  @override
  _DownloadSongListComponentState createState() =>
      _DownloadSongListComponentState();
}

class _DownloadSongListComponentState extends State<DownloadSongListComponent> {
  List<DownloadSongListModel> songListData = getDownloadedSongList();

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          itemCount: songListData.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          separatorBuilder: (context, index) =>
              const CommonAppDividerWidget(height: 30),
          itemBuilder: (ctx, index) {
            DownloadSongListModel data = songListData[index];
            return AnimatedItemWidget(child: DownloadItemWidget(modObj: data));
          },
        ),
      ],
    );
  }
}
