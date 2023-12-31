import 'package:get/get.dart';

import '../helpers/catch_storage.dart';
import '../helpers/constants.dart';
import '../views/auth/login_screen.dart';
import '../views/layout/layout_screen.dart';
import '../views/on_boarding/on_boarding_screen.dart';
import '../views/splash/choose_language_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    await Future.delayed(Duration(seconds: 2));

    if (CatchStorage.get(k_langKey) == null) {
      await Get.off(() => ChooseLanguageScreen());
      return;
    }
    if (CatchStorage.get(k_onBoardingKey) == null &&
        CatchStorage.get(k_onBoardingKey) == false) {
      await Get.off(() => OnBoardingScreen());
      return;
    }
    if (CatchStorage.get(k_userKey) == null) {
      await Get.off(() => LoginScreen());
      return;
    }
    if (CatchStorage.get(k_userKey) != null) {
      await Get.off(() => LayoutScreen());
      // await Get.off(() => HomeScreen());
      return;
    }
  }
}
