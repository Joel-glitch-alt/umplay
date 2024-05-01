import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/components/common_app_divider.dart';
import '../model/notification_model.dart';
import 'notification_widget.dart';

class AllNotificationList extends StatefulWidget {
  const AllNotificationList({super.key});

  @override
  State<AllNotificationList> createState() => _AllNotificationListState();
}

class _AllNotificationListState extends State<AllNotificationList> {
  List<NotificationModel> newNotificationData = getNewNotificationList();
  List<NotificationModel> earlierNotificationData =
      getEarlierNotificationList();

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
            return AnimatedItemWidget(child: NotificationWidget(modObj: data));
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
            return AnimatedItemWidget(child: NotificationWidget(modObj: data));
          },
        ),
      ],
    );
  }
}
