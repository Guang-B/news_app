import 'package:get/get.dart';
import 'package:news_app/app/modules/home/models/Response_news_model.dart';

class NewsDetailController extends GetxController {


  late Articles article;

  @override
  void onInit() {
    super.onInit();
    article = Get.arguments;
  }

}
