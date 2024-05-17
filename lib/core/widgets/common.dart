import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

PreferredSizeWidget commonAppBarWidget(
  BuildContext context, {
  String? title,
  Widget? titleWidget,
  Widget? actionWidget1,
  Widget? actionWidget2,
  bool? showBack,
  bool isCenter = true,
}) {
  return appBarWidget(
    title ?? '',
    elevation: 0,
    textColor: Colors.white,
    color: Colors.transparent,
    titleWidget: title == '' ? titleWidget.validate() : null,
    showBack: showBack ?? true,
    center: isCenter,
    actions: [
      actionWidget1 ?? const SizedBox(),
      actionWidget2 ?? const SizedBox()
    ],
  );
}
