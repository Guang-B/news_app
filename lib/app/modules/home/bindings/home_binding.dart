import 'package:get/get.dart';
import 'package:news_app/app/data/api_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiProvider());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
