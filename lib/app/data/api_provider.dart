import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_app/app/helper/my_loading.dart';
import 'package:news_app/app/helper/my_toast.dart';
import 'package:news_app/app/modules/home/models/Response_news_model.dart';

import '../helper/strings.dart';

class ApiProvider extends GetConnect {
  static const int timeoutDuration = 6;
  static const String apiKey = "914b5ad145c2419ba7a04d299aa5083d";
  @override
  void onInit() {
    httpClient.baseUrl = 'https://newsapi.org/v2';

    httpClient.addRequestModifier<dynamic>((request) async {
      log("request url : ${request.url.toString()}");
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      log("response ${response.bodyString}");
      if (!response.isOk) {
        MyLoading.dismiss();
        var statusCode = response.statusCode;
        if (statusCode == 500) {
          MyToast.error(Strings.serverError);
        } else if (statusCode == 404) {
          MyToast.error(Strings.notFoundError);
        } else if (statusCode == 403) {
          MyToast.error(Strings.accessDenied);
        } else {
          MyToast.error("${Strings.unknownError} : $statusCode");
        }
      }
      log("response on : ${request.url}");
      log("response Code : ${response.statusCode}");
      return response;
    });
  }


  Future<ResponseNewsModel> getTopHeadlines({String country = "id", String? keyword = "",String category = ""}) async {
    try {
      Map<String,dynamic> params = {
        "country" : country,
        "apiKey" : apiKey,
        "q" : keyword,
        "category" : category
      };
      final response = await get('/top-headlines',query: params).timeout(const Duration(seconds: timeoutDuration));

      return ResponseNewsModel.fromJson(response.body);
    } on TimeoutException {
      MyToast.info(Strings.connectionTimeOut);
      MyLoading.dismiss();
      rethrow;
    }catch (e){
      MyToast.error(Strings.unknownError);
      MyLoading.dismiss();
      rethrow;

    }
  }
}
