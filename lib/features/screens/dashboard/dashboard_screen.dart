import 'package:flutter/material.dart';

import '../../../core/components/app_scaffold.dart';
import '../../../core/components/icon_background_widget.dart';
import '../../../core/utils/common.dart';
import '../../../core/constants/images.dart';
import '../../home/presentation/screens/home_fragment.dart';
import 'fragment/library_fragment.dart';
import 'fragment/music_fragment.dart';
import 'fragment/podcasts_fragment.dart';
import 'fragment/setting_fragment.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedItemIndex = 2;

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    _pages = [
      const MusicFragment(),
      const PodcastsFragment(),
      const HomeFragment(),
      const LibraryFragment(),
      const SettingFragment(),
    ];

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void _onTap(int index) {
    _selectedItemIndex = index;
    setState(() {});
  }

  Widget customBottomNav(BuildContext context, bool isActiveIcon, String icon) {
    if (isActiveIcon) {
      return IconBackgroundWidget(
          icon: icon,
          height: 22,
          width: 22,
          padding: 8,
          iconColor: Colors.white,
          color: Colors.grey.withAlpha(80));
    } else {
      return Image.asset(icon, height: 22, width: 22, color: Colors.white);
    }
  }

  Widget _bottomTab() {
    return Container(
      decoration: BoxDecoration(
        gradient: primaryHomeLinearGradient(),
        boxShadow: const [
          BoxShadow(spreadRadius: 0, color: Colors.transparent)
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedItemIndex,
        onTap: _onTap,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black.withOpacity(0.68),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: customBottomNav(context, false, ic_music),
            activeIcon: customBottomNav(context, true, ic_music),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: customBottomNav(context, false, ic_headphones),
            activeIcon: customBottomNav(context, true, ic_headphones),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: customBottomNav(context, false, ic_home),
            activeIcon: customBottomNav(context, true, ic_home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: customBottomNav(context, false, ic_queue_music),
            activeIcon: customBottomNav(context, true, ic_queue_music),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: customBottomNav(context, false, ic_setting),
            activeIcon: customBottomNav(context, true, ic_setting),
            label: '',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: _bottomTab(),
      body: _pages[_selectedItemIndex],
    );
  }
}
