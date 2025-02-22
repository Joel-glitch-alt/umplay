import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:umplay/core/utils/string_extensions.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/components/app_scaffold.dart';
import '../../../core/components/cached_image_widget.dart';
import '../../../core/components/common_app_button.dart';
import '../../../core/constants/colors.dart';
import '../../../core/utils/common.dart';
import '../../../core/constants/images.dart';
import 'choose_artists_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController dOBCont = TextEditingController();
  TextEditingController contactNumberCont = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode dOBFocus = FocusNode();
  FocusNode contactNumberFocus = FocusNode();

  String countryCode = '44';

  List<String> listOfCountryCode = ['91', '23', '44', '22'];

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
      resizeToAvoidBottomInset: true,
      appBar: commonAppBarWidget(context),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: boxDecorationWithRoundedCorners(
                        boxShape: BoxShape.circle),
                    child: const CachedImageWidget(
                        url: img_profile,
                        height: 120,
                        fit: BoxFit.cover,
                        width: 120,
                        radius: 150),
                  ),
                  8.height,
                  Text('Change Photo',
                      style: primaryTextStyle(
                          size: 14, color: appTextSecondaryColor)),
                  30.height,
                  AppTextField(
                    controller: nameCont,
                    focus: nameFocus,
                    nextFocus: dOBFocus,
                    textFieldType: TextFieldType.NAME,
                    textInputAction: TextInputAction.next,
                    textStyle: primaryTextStyle(color: Colors.white),
                    decoration: inputDecoration(context,
                        label: 'Name',
                        prefixIcon: ic_user
                            .iconImage(size: 10, color: Colors.white)
                            .paddingAll(13)),
                  ),
                  16.height,
                  AppTextField(
                    controller: dOBCont,
                    focus: dOBFocus,
                    nextFocus: emailFocus,
                    textFieldType: TextFieldType.OTHER,
                    textInputAction: TextInputAction.next,
                    textStyle: primaryTextStyle(color: Colors.white),
                    decoration: inputDecoration(context,
                        label: 'Date of Birth',
                        prefixIcon: ic_calendar
                            .iconImage(size: 10, color: Colors.white)
                            .paddingAll(13)),
                  ),
                  16.height,
                  AppTextField(
                    controller: emailCont,
                    focus: emailFocus,
                    nextFocus: contactNumberFocus,
                    textFieldType: TextFieldType.EMAIL,
                    textInputAction: TextInputAction.next,
                    textStyle: primaryTextStyle(color: Colors.white),
                    decoration: inputDecoration(context,
                        label: 'Email',
                        prefixIcon: ic_mail
                            .iconImage(size: 10, color: Colors.white)
                            .paddingAll(13)),
                  ),
                  16.height,
                  AppTextField(
                    controller: contactNumberCont,
                    focus: contactNumberFocus,
                    textFieldType: TextFieldType.PHONE,
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    textInputAction: TextInputAction.done,
                    textStyle: primaryTextStyle(color: Colors.white),
                    decoration: inputDecoration(
                      context,
                      label: 'Phone Number',
                      prefixIcon: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: countryCode,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.grey, size: 22),
                          dropdownColor: lightPurple,
                          onChanged: (dynamic value) {
                            countryCode = value;
                            setState(() {});
                          },
                          items: listOfCountryCode
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text('+$e',
                                      style: secondaryTextStyle(
                                          color: Colors.grey)),
                                ),
                              )
                              .toList(),
                        ).paddingRight(8),
                      ).paddingLeft(13),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: CommonAppButton(
              btnText: 'Continue',
              onPressed: () {
                hideKeyboard(context);
                const ChooseArtistsScreen().launch(context,
                    pageRouteAnimation: PageRouteAnimation.Slide);
              },
            ),
          ),
        ],
      ),
    );
  }
}
