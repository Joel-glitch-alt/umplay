import 'package:get/get.dart';

class AuthService extends GetxService {
  static final AuthService instance = Get.find();

  final RxString _accessToken = ''.obs;
  final RxString _tokenUser = ''.obs;
  final RxBool _isFirstTime = true.obs;

  String get accessToken => _accessToken.value;
  String get username => _tokenUser.value;
  bool get isFirstTime => _isFirstTime.value;

  void setAccessToken(String token) {
    _accessToken.value = token;
  }

  void setUserToken(String user) {
    _tokenUser.value = user;
  }

  void setIsFirstTime(bool status) {
    _isFirstTime.value = status;
  }
}
