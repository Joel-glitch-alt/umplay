import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/common.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final String? activeText;
  final String? inactiveText;
  final Color? activeTextColor;
  final Color? inactiveTextColor;

  const CustomSwitch({super.key, 
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.activeText,
    this.inactiveText,
    this.activeTextColor,
    this.inactiveTextColor,
  });

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
      begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
      end: widget.value ? Alignment.centerLeft : Alignment.centerRight,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 70.0,
            height: 35.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: dividerDarkColor,
              /*I commented here.
              color: _circleAnimation.value == Alignment.centerLeft
                  ? widget.inactiveColor
                  : widget.activeColor,*/

              /*gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // You can set your own colors in here!
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
              ),*/
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 4.0, bottom: 4.0, right: 4.0, left: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _circleAnimation.value == Alignment.centerRight
                      ? Padding(
                          padding: const EdgeInsets.only(left: 34.0, right: 0),
                          child: Text(
                            widget.activeText.validate(),
                            style: TextStyle(
                                color: widget.activeTextColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 16.0),
                          ),
                        )
                      : Container(),
                  Align(
                    alignment: _circleAnimation.value,
                    child: Container(
                      width: 25.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.value ? null : Colors.white,
                        gradient:
                            widget.value ? primaryHomeLinearGradient() : null,
                      ),
                    ),
                  ),
                  _circleAnimation.value == Alignment.centerLeft
                      ? Padding(
                          padding: const EdgeInsets.only(left: 0, right: 34.0),
                          child: Text(
                            widget.inactiveText.validate(),
                            style: TextStyle(
                                color: widget.inactiveTextColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 16.0),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
