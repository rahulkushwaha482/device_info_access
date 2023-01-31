import 'package:device_info_access/modules/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SplashView extends GetView<SplashController>{
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return const  SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
              padding:  EdgeInsets.all(40.0),
              child: Text(
                'Get Device Info',
                style: TextStyle(
                    fontSize: 34,
                    color: Colors.green
                ),
              )
          ),
        ),
      ),
    );
  }


}
