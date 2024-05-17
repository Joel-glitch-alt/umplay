import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/core/widgets/loaders.dart';
import 'package:umplay/features/authentication/data/models/login_request.dart';

import 'package:get_storage/get_storage.dart';
import 'package:umplay/features/authentication/domain/entities/token_user.dart';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:umplay/features/authentication/domain/usecases/login_usecase.dart';
import 'package:umplay/navigation_screen.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  static LoginUseCase get _loginUseCase => Get.find();

  GlobalKey<FormState> loginFormKkey = GlobalKey<FormState>();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> login() async {
    if (loginFormKkey.currentState!.validate() == false) {
      return;
    }
    final dataState = await _loginUseCase.call(LoginRequestModel(
        phone: phone.value.text, password: password.value.text));

    if (dataState is DataSuccess) {
      Map<String, dynamic> decodedToken =
          JwtDecoder.decode(dataState.data!.token as String);
      final TokenUser tokenUser = TokenUser.fromJson(decodedToken);
      final deviceStorage = GetStorage();

      deviceStorage.write('tokenUser', tokenUser.toJson());
      Loaders.showSuccess(title: 'Login successfull', message: '');
      Get.off(const NavigationScreen());
      if (kDebugMode) {
        print(decodedToken);
      }
    } else if (dataState is DataFailed) {
      if (kDebugMode) {
        print('Login Error');
        Loaders.showError(title: 'Something went wrong', message: 'error');
      }
    }
  }
}
