import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenRouteFunction(
      splash: Lottie.asset('assets/animations/map.json'),
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 250,
      animationDuration: const Duration(seconds: 3),
      screenRouteFunction: () async {
        return await Get.toNamed('/home');
      },
    );
  }
}
