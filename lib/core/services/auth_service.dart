import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:umplay/core/services/cache_manager.dart';

class AuthService extends GetxService with CacheManager {
  static final AuthService instance = Get.find();

  final RxBool _isLoggedIn = false.obs;

  bool get isLoggedIn => _isLoggedIn.value;
  String get accessToken => getToken() ?? '';

  void logOut() {
    _isLoggedIn.value = false;
    removeToken();
  }

  void login(String? token) async {
    _isLoggedIn.value = true;
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (kDebugMode) {
      print(token);
    }
    if (token.toString().isNotEmpty) {
      _isLoggedIn.value = true;
    }
  }
}
