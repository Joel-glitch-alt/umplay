import 'package:flutter/material.dart';
import 'package:umplay/core/constants/colors_constants.dart';
import 'package:umplay/core/widgets/scaffold_background.dart';

class AppScaffold extends StatelessWidget {
  final bool resizeToAvoidBottomInset;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget body;

  const AppScaffold(
      {super.key,
      required this.body,
      this.resizeToAvoidBottomInset = false,
      this.appBar,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C49A8),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      bottomNavigationBar: bottomNavigationBar,
      appBar: appBar,
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          const Positioned(
            top: -80,
            right: -150,
            child: ScaffoldBackground(color: UColors.primaryColor),
          ),
          const Positioned(
            bottom: -80,
            left: -150,
            child: ScaffoldBackground(color: UColors.secondary),
          ),
          body,
        ],
      ),
    );
  }
}
