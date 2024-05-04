import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:umplay/core/components/full_screen_loader.dart';
import 'package:umplay/core/components/loaders.dart';
import 'package:umplay/core/resources/data_state.dart';
import 'package:umplay/features/auth/data/models/login_request.dart';
import 'package:umplay/features/auth/domain/entities/token_user.dart';
import 'package:umplay/features/auth/domain/usecases/login_usecase.dart';
import 'package:umplay/features/screens/dashboard/dashboard_screen.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  static LoginUseCase get loginUsecaseInstance => Get.find();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  Future<void> login() async {
    try {
      FullScreenLoader.openLoadingDialog('Loading...', 'animation');
      final dataState = await loginUsecaseInstance.call(LoginRequestModel(
          phone: phoneController.value.text,
          password: passwordController.value.text));

      if (dataState is DataSuccess) {
        Map<String, dynamic> decodedToken =
            JwtDecoder.decode(dataState.data!.token as String);
        final TokenUser tokenUser = TokenUser.fromJson(decodedToken);
        final deviceStorage = GetStorage();

        deviceStorage.write('token', dataState.data!.token);
        deviceStorage.write('tokenUser', tokenUser.toJson());
        Loaders.showSuccess(title: 'Login successfull', message: '');
        Get.off(const DashBoardScreen());
        if (kDebugMode) {
          print(decodedToken);
        }
      } else if (dataState is DataFailed) {
        if (kDebugMode) {
          print(dataState.data);
          Loaders.showError(
              title: 'Something went wrong',
              message: dataState.error.toString());
        }
      }
    } finally {
      FullScreenLoader.stopLoadingDialog();
    }
  }
}
