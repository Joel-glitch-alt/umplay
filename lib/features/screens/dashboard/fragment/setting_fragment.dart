import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/components/app_scaffold.dart';
import '../../../../core/components/cached_image_widget.dart';
import '../../../../core/components/common_app_divider.dart';
import '../../../../core/components/custom_switch.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/common.dart';
import '../../../../core/constants/images.dart';

class SettingFragment extends StatefulWidget {
  const SettingFragment({super.key});

  @override
  _SettingFragmentState createState() => _SettingFragmentState();
}

class _SettingFragmentState extends State<SettingFragment> {
  double staticDividerHeight = 0;
  double _currentSliderValue = 40;

  Color commonSplashColor = lightPurple.withOpacity(0.3);

  bool isGapLessDefault = false;
  bool isAutoMixDefault = false;
  bool isNormalVolumeDefault = false;
  bool isOffline = false;
  bool isPrivate = false;
  bool isDarkMode = false;
  bool isDataSaver = false;

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

  Widget horizontalOptionsWidget(
      {String? icon, String? text, Color? color, Gradient? gradient}) {
    return Container(
      width: context.width() / 4 - 18,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: boxDecorationDefault(
        borderRadius: radius(8),
        color: color,
        gradient: gradient,
        boxShadow: defaultBoxShadow(
            blurRadius: 0, shadowColor: Colors.black.withAlpha(20)),
      ),
      child: Column(
        children: [
          Image.asset(icon.validate(), height: 22, width: 22),
          6.height,
          Marquee(
            child: Text(text.validate().capitalizeFirstLetter(),
                style: secondaryTextStyle(color: textPrimaryColorGlobal),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }

  Widget buildTopWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingItemWidget(
          title: 'Esther Howard',
          titleTextStyle: boldTextStyle(color: textPrimaryColorGlobal),
          subTitle: 'estherhoward@gmail.com',
          subTitleTextStyle: primaryTextStyle(color: textPrimaryColorGlobal),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          splashColor: lightPurple.withOpacity(0.3),
          hoverColor: lightPurple.withOpacity(0.3),
          onTap: () {
            //
          },
          leading: const CachedImageWidget(
              url: img_profile,
              height: 75,
              fit: BoxFit.cover,
              width: 75,
              radius: 100),
        ),
        const CommonAppDividerWidget(height: 30, thickness: 1),
        Wrap(
          spacing: 12,
          direction: Axis.horizontal,
          children: [
            horizontalOptionsWidget(
              text: 'Offline',
              icon: ic_wifi_signal_off,
              color: isOffline
                  ? Colors.grey.withAlpha(80)
                  : Colors.grey.withAlpha(25),
              gradient: isOffline ? primaryHomeLinearGradient() : null,
            ).onTap(() {
              isOffline = !isOffline;
              setState(() {});
            }, borderRadius: radius(8)),
            horizontalOptionsWidget(
              text: 'Private',
              icon: ic_view_privacy,
              color: isPrivate
                  ? Colors.grey.withAlpha(80)
                  : Colors.grey.withAlpha(25),
              gradient: isPrivate ? primaryHomeLinearGradient() : null,
            ).onTap(() {
              isPrivate = !isPrivate;
              setState(() {});
            }, borderRadius: radius(8)),
            horizontalOptionsWidget(
              text: 'Dark Mode',
              icon: ic_dark_mode,
              color: isDarkMode
                  ? Colors.grey.withAlpha(80)
                  : Colors.grey.withAlpha(25),
              gradient: isDarkMode ? primaryHomeLinearGradient() : null,
            ).onTap(() {
              isDarkMode = !isDarkMode;
              setState(() {});
            }, borderRadius: radius(8)),
            horizontalOptionsWidget(
              text: 'Data Saver',
              icon: ic_data_saver,
              color: isDataSaver
                  ? Colors.grey.withAlpha(80)
                  : Colors.grey.withAlpha(25),
              gradient: isDataSaver ? primaryHomeLinearGradient() : null,
            ).onTap(() {
              isDataSaver = !isDataSaver;
              setState(() {});
            }, borderRadius: radius(8)),
          ],
        ).paddingSymmetric(horizontal: 16),
      ],
    );
  }

  Widget buildMiddleWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your Account', style: boldTextStyle(size: 18))
            .paddingSymmetric(horizontal: 16),
        10.height,
        SettingItemWidget(
          title: 'Your plan',
          titleTextStyle: primaryTextStyle(),
          splashColor: commonSplashColor,
          hoverColor: commonSplashColor,
          onTap: () {
            //
          },
        ),
        CommonAppDividerWidget(height: staticDividerHeight),
        SettingItemWidget(
          title: 'Music preferences',
          titleTextStyle: primaryTextStyle(),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          splashColor: commonSplashColor,
          hoverColor: commonSplashColor,
          onTap: () {
            //
          },
        ),
        CommonAppDividerWidget(height: staticDividerHeight),
        SettingItemWidget(
          title: 'Manage Language',
          titleTextStyle: primaryTextStyle(),
          subTitle: 'English(India)',
          splashColor: commonSplashColor,
          hoverColor: commonSplashColor,
          onTap: () {
            //
          },
        ),
        CommonAppDividerWidget(height: staticDividerHeight),
        SettingItemWidget(
          title: 'Notifications',
          titleTextStyle: primaryTextStyle(),
          subTitle: 'Get alerts related to your app or music',
          splashColor: commonSplashColor,
          hoverColor: commonSplashColor,
          onTap: () {
            //
          },
        ),
      ],
    );
  }

  Widget buildBottomWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Playback', style: boldTextStyle(size: 18))
            .paddingSymmetric(horizontal: 16),
        10.height,
        SettingItemWidget(
          title: 'Crossfade',
          titleTextStyle: primaryTextStyle(),
          subTitle: 'Allows you to crossfade between songs',
          splashColor: commonSplashColor,
          hoverColor: commonSplashColor,
          onTap: () {
            //
          },
        ),
        Row(
          children: [
            Text('${_currentSliderValue.toInt().toString()}%',
                style: secondaryTextStyle()),
            SliderTheme(
              data: const SliderThemeData(
                  trackHeight: 1,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)),
              child: Slider(
                value: _currentSliderValue,
                max: 100,
                activeColor: Colors.white,
                inactiveColor: dividerDarkColor,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ).withSize(height: 16, width: context.width() * 0.80),
          ],
        ).paddingSymmetric(horizontal: 16),
        16.height,
        CommonAppDividerWidget(height: staticDividerHeight),
        SettingItemWidget(
          title: 'Gapless',
          subTitle: 'Allows Gapless playback',
          trailing: Transform.scale(
            scale: 0.6,
            alignment: Alignment.centerRight,
            child: CustomSwitch(
              value: isGapLessDefault,
              onChanged: (val) {
                isGapLessDefault = val;
                setState(() {});
              },
            ),
          ),
        ),
        CommonAppDividerWidget(height: staticDividerHeight),
        SettingItemWidget(
          title: 'Automix',
          subTitle: 'Allows smooth transitions between songs in a playlist.',
          trailing: Transform.scale(
            scale: 0.6,
            alignment: Alignment.centerRight,
            child: CustomSwitch(
              value: isAutoMixDefault,
              onChanged: (val) {
                isAutoMixDefault = val;
                setState(() {});
              },
            ),
          ),
        ),
        CommonAppDividerWidget(height: staticDividerHeight),
        SettingItemWidget(
          title: 'Normalize volume',
          subTitle: 'Set the same volume level for all the songs',
          trailing: Transform.scale(
            scale: 0.6,
            alignment: Alignment.centerRight,
            child: CustomSwitch(
              value: isNormalVolumeDefault,
              onChanged: (val) {
                isNormalVolumeDefault = val;
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: commonAppBarWidget(context, title: 'Settings'),
      body: AnimatedScrollView(
        padding: const EdgeInsets.only(bottom: 30),
        children: [
          16.height,
          buildTopWidget(),
          30.height,
          buildMiddleWidget(),
          14.height,
          buildBottomWidget(),
        ],
      ),
    );
  }
}
