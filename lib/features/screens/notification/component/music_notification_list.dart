import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/components/common_app_divider.dart';
import '../model/notification_model.dart';
import 'notification_widget.dart';

class MusicNotificationList extends StatefulWidget {
  const MusicNotificationList({super.key});

  @override
  State<MusicNotificationList> createState() => _MusicNotificationListState();
}

class _MusicNotificationListState extends State<MusicNotificationList> {
  List<NotificationModel> newNotificationData = getNewMusicNotificationList();
  List<NotificationModel> earlierNotificationData =
      getEarlierMusicNotificationList();

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
            return NotificationWidget(modObj: data);
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
            return NotificationWidget(modObj: data);
          },
        ),
      ],
    );
  }
}
