import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:umplay/core/services/cache_manager.dart';
import 'package:umplay/features/authentication/domain/entities/token_user.dart';

class HomeController extends GetxController with CacheManager {
  static HomeController get instance => Get.find();
  TokenUser? tokenUser;

  @override
  void onInit() {
    super.onInit();

    var authUser = TokenUser();
    tokenUser = authUser;
  }
}
