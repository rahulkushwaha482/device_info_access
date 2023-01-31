import 'dart:developer';

import 'package:device_info_access/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomePage extends GetView<HomeController> {
   HomePage({Key? key}) : super(key: key);

  var posX;
  var posY;

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    log(controller.gx.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Info'),
        actions: [
          IconButton(onPressed:controller.tourchOnOff, icon: Icon(Icons.flashlight_on))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(
            () => Column(
              children: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Model',
                      style:
                          TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
                    ),
                    Text(
                      controller.model.toString(),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Product',
                      style:
                          TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
                    ),
                    Text(
                      controller.product.toString(),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Version name',
                      style:
                          TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
                    ),
                    Text(
                      controller.version['codename'].toString(),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Version SDk Number',
                      style:
                          TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
                    ),
                    Text(
                      controller.version['sdkInt'].toString(),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'manufacturer',
                      style:
                          TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
                    ),
                    Text(
                      controller.manufacturer.toString(),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Physical Device',
                      style:
                          TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
                    ),
                    Text(
                      controller.isPhysicalDevice.toString(),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hardware',
                      style:
                          TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
                    ),
                    Text(
                      controller.hardware.toString(),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Display',
                      style:
                          TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
                    ),
                    Text(
                      controller.display.toString(),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Brand',
                      style:
                          TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
                    ),
                    Text(
                      controller.brand.toString(),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Device',
                      style:
                          TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
                    ),
                    Text(
                      controller.device.toString(),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'ID',
                      style:
                          TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
                    ),
                    Text(
                      controller.id.toString(),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'CPU Name',
                      style:
                          TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
                    ),
                    Text(
                      controller.cpuType.toString(),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 14),
                    ),
                  ],
                ),
                const Divider(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(controller.gx.toString()),
                  Text(controller.gy.toString()),
                ],),


                StreamBuilder<GyroscopeEvent>(
                    stream: SensorsPlatform.instance.gyroscopeEvents,
                    builder: (context, snapshot) {
                      // print("");
                      if (snapshot.hasData) {
                         posX = controller.gx.toDouble() + (snapshot.data!.y*10);
                         posY = controller.gy.toDouble() + (snapshot.data!.x*10);
                      }
                      return Transform.translate(
                        offset: Offset(posX, posY),
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.red,
                        ),
                      );
                    }),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
