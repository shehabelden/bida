import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/custom_text.dart';
import '../../controllers/splash_controller.dart';
import '../../helpers/constants.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/traveler1.png"),
            CustomText(
              text: "traveler".tr,
              color: k_primaryColor,
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
