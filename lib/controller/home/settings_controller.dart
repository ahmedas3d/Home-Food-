import 'package:get/get.dart';
import 'package:home_food/core/services/services.dart';

import '../../core/constant/routes.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  late String id;

  @override
  void onInit() {
    id = myServices.sharedPreferences.getString("id")!;
    super.onInit();
  }

  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
