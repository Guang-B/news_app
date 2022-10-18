import 'dart:async';

import 'package:get/get.dart';
import 'package:news_app/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2),() {
        Get.offAllNamed(Routes.HOME);
    });
  }

}
