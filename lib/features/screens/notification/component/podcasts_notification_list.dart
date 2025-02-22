import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/components/common_app_divider.dart';
import '../model/notification_model.dart';
import 'notification_widget.dart';

class PodcastsNotificationList extends StatefulWidget {
  final String? selectedText;

  const PodcastsNotificationList({super.key, this.selectedText});

  @override
  State<PodcastsNotificationList> createState() =>
      _PodcastsNotificationListState();
}

class _PodcastsNotificationListState extends State<PodcastsNotificationList> {
  List<NotificationModel> newNotificationData =
      getNewPodcastsNotificationList();
  List<NotificationModel> earlierNotificationData =
      getEarlierPodcastsNotificationList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('New', style: boldTextStyle(size: 18)),
        16.height,
        ListView.separated(
          itemCount: newNotificationData.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) =>
              const CommonAppDividerWidget(height: 30),
          itemBuilder: (ctx, index) {
            NotificationModel data = newNotificationData[index];
            return NotificationWidget(
                modObj: data, selectedText: widget.selectedText);
          },
        ),
        const CommonAppDividerWidget(height: 30),
        Text('Earlier', style: boldTextStyle(size: 18)),
        16.height,
        ListView.separated(
          itemCount: earlierNotificationData.length,
          separatorBuilder: (context, index) =>
              const CommonAppDividerWidget(height: 30),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            NotificationModel data = earlierNotificationData[index];
            return NotificationWidget(
                modObj: data, selectedText: widget.selectedText);
          },
        ),
      ],
    );
  }
}
