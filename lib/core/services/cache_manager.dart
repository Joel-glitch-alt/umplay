
import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write('token', token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read('token');
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove('token');
  }

  // TokenUser? getTokenUser() {
  //   final storage = GetStorage();
  //   var authUser = storage.read('tokenUser');
  //   if (authUser is String) {
  //     authUser = jsonDecode(authUser);
  //   }
  //   final TokenUser tokenUser =
  //       TokenUser.fromJson(authUser as Map<String, dynamic>);

  //   return tokenUser;
  // }
}
