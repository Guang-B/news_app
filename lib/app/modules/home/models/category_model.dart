import 'package:get/get.dart';

class CategoryModel {
  final String value;
  RxBool isActive = false.obs;

  CategoryModel(this.value);
}