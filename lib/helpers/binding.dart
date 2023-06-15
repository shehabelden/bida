import 'package:get/get.dart';

import '../controllers/auth/login_controller.dart';
import '../controllers/auth/register_controller.dart';
import '../controllers/auth/rest_password_controller.dart';
import '../controllers/home/home_controller.dart';
import '../controllers/home/search_option_controller.dart';
import '../controllers/home/search_results_controller.dart';
import '../controllers/home/tour_details_controller.dart';
import '../controllers/layout/layout_controller.dart';
import '../controllers/profile/add_card_controller.dart';
import '../controllers/profile/change_language_controller.dart';
import '../controllers/profile/currency_converter_controller.dart';
import '../controllers/profile/edit_account_controller.dart';
import '../controllers/profile/profile_controller.dart';
import '../controllers/splash_controller.dart';
import '../multi_language/controllers/multi_laguage_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => MultiLanguageController(), fenix: true);
    Get.lazyPut(() => RegisterController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => RestPasswordController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => SearchOptionController(), fenix: true);
    Get.lazyPut(() => TourDetailsController(), fenix: true);
    Get.lazyPut(() => SearchResultsController(), fenix: true);
    Get.lazyPut(() => LayoutController(), fenix: true);
    Get.lazyPut(() => AddCardController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => EditAccountController(), fenix: true);
    Get.lazyPut(() => CurrencyConverterController(), fenix: true);
    Get.lazyPut(() => ChangeLanguageController(), fenix: true);
  }
}
