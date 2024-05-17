import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umplay/core/widgets/full_screen_loader.dart';
import 'package:umplay/core/widgets/loaders.dart';
import 'package:umplay/core/constants/icon_constants.dart';

class SignUpController extends GetxController {
  static SignUpController instance = Get.find();

  //RxBool isLoading = false.obs;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final region = TextEditingController();
  final hidePassword = true.obs;

  final GlobalKey<FormState> signupFormKkey = GlobalKey<FormState>();

  //Functions...

  //Sign up...
  Future<void> signup() async {
    try {
      FullScreenLoader.openLoadingDialog('Please wait...', icStar);
      if (signupFormKkey.currentState!.validate()) {
        return;
      }
    } catch (e) {
      Loaders.showError(title: 'Something went wrong', message: e.toString());
    } finally {
      FullScreenLoader.stopLoadingDialog();
    }
  }
}
