import 'dart:async';
import 'dart:developer';
import 'package:device_info_access/routes/app_pages.dart';
import 'package:device_info_access/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded<Future<void>>(
    () async {
      runApp(
        GetMaterialApp(
          title: 'Device Info Access',
          initialRoute: AppRoutes.splash,
          debugShowCheckedModeBanner: false,
          getPages: AppPages.pages,
          // initialRoute: AppPages.INITIAL,
          //  unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
          //  getPages: AppPages.routes,
          //  debugShowCheckedModeBanner: false,
          //builder: BotToastInit(),
          //  navigatorObservers: [BotToastNavigatorObserver()],
        ),
      );
    },
    (dynamic error, StackTrace stackTrace) {
      log('error $error');
      log('stackTrace $stackTrace');
    },
  );
}
