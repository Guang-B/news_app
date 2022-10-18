import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/data/api_provider.dart';
import 'package:news_app/app/modules/home/models/Response_news_model.dart';
import 'package:news_app/app/modules/home/models/category_model.dart';

class HomeController extends GetxController {
  final ApiProvider provider = Get.find();

  var botNavIndex = 0.obs;

  final textSearchController = TextEditingController();


  List<CategoryModel> categoryList = [];
  var activeCategoryIndex = -1.obs;

  @override
  void onInit() {
    super.onInit();
    getNews();
    initCategoryData();
  }
  RxBool isLoading = false.obs;

  RxList<Articles> mArticleList = <Articles>[].obs;


  Future<void> getNews({String keyword = "",String category =""}) async {
    isLoading.value = true;
    var responseGetNews = await provider.getTopHeadlines(keyword: keyword,category: category);
    isLoading.value = false;

    mArticleList.value = responseGetNews.articles;

  }
  
  void initCategoryData(){
    categoryList.add(CategoryModel("business"));
    categoryList.add(CategoryModel("entertainment"));
    categoryList.add(CategoryModel("general"));
    categoryList.add(CategoryModel("health"));
    categoryList.add(CategoryModel("sports"));
    categoryList.add(CategoryModel("technology"));
  }

}
