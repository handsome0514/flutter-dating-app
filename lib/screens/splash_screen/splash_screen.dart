import 'package:bematched/config.dart';
import 'package:bematched/screens/splash_screen/splash_screen_controller.dart';
import 'package:bematched/utils/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  final _controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImageAssets.logo),
      ),
    );
  }
}
