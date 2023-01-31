import 'package:device_info_access/modules/home/binding/home_binding.dart';
import 'package:device_info_access/modules/home/view/home_page.dart';
import 'package:device_info_access/modules/splash/binding/splash_binding.dart';
import 'package:device_info_access/modules/splash/view/splash_view.dart';
import 'package:device_info_access/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashView(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.home,
        page: () =>  HomePage(),
        binding: HomeBinding())
  ];
}
