import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLoading{
  static void show() {
    if(Get.isDialogOpen == false){
      Get.dialog(const Center(
        child: CircularProgressIndicator(),
      ));
    }
  }

  static void dismiss() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }
}