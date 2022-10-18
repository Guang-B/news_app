import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/gen/assets.gen.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(Assets.images.splashBg.path)
            )
        ),
        child: Center(
            child: Image.asset(Assets.images.saltLogo.path)

        ),
      ),
    );
  }
}
