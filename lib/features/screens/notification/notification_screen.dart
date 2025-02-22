import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/components/app_scaffold.dart';
import '../../../core/utils/common.dart';
import 'component/all_notification_list.dart';
import 'component/music_notification_list.dart';
import 'component/podcasts_notification_list.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> chipList = ['All', 'Music', 'Podcasts'];

  String selectedText = '';

  int selectedIndex = 0;

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
      appBar: commonAppBarWidget(context, title: 'Notifications'),
      body: AnimatedScrollView(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Text('The latest releases from artists, and podcasts ...',
              style: secondaryTextStyle()),
          16.height,
          Wrap(
            spacing: 16,
            children: List.generate(chipList.length, (index) {
              return GestureDetector(
                onTap: () {
                  selectedIndex = index;
                  if (index == selectedIndex) {
                    selectedText = chipList[index];
                  }
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: boxDecorationDefault(
                    borderRadius: radius(20),
                    color: index == selectedIndex
                        ? Colors.grey.withAlpha(80)
                        : Colors.grey.withAlpha(25),
                    gradient: index == selectedIndex
                        ? primaryHomeLinearGradient()
                        : null,
                    boxShadow: defaultBoxShadow(
                        blurRadius: 0, shadowColor: Colors.black.withAlpha(20)),
                  ),
                  child: Text(chipList[index],
                      style: primaryTextStyle(
                          size: 14, color: textPrimaryColorGlobal)),
                ),
              );
            }),
          ),
          22.height,
          if (selectedText == 'All') const AllNotificationList(),
          if (selectedText == 'Music') const MusicNotificationList(),
          if (selectedText == 'Podcasts')
            PodcastsNotificationList(selectedText: selectedText),
        ],
      ),
    );
  }
}
