import 'package:device_info_access/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 1500)).then(
      (value) {
         Get.offNamed(AppRoutes.home);
      },
    );
  }
}
