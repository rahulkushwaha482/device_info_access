import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:sim_data/sim_data.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:torch_light/torch_light.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:device_information/device_information.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  var id = ''.obs;
  var board = ''.obs;
  var bootLoader = ''.obs;
  var brand = ''.obs;
  var device = ''.obs;
  var display = ''.obs;
  var displayMetrics = {}.obs;
  var fingerPrint = ''.obs;
  var hardware = ''.obs;
  var host = ''.obs;
  var isPhysicalDevice = false.obs;
  var manufacturer = ''.obs;
  var model = ''.obs;
  var product = ''.obs;
  var tag = ''.obs;
  var types = ''.obs;
  var version = {}.obs;
  var data = {}.obs;
  var imeiNo = ''.obs;
  var cpuType = ''.obs;
  var gx = 0.0.obs;
  var gy = 0.0.obs;
  var gz = 0.0.obs;
  var isTourchLightOn = false.obs;

  @override
  void onInit() {
    super.onInit();
    _getDeviceInfo();
    _getGyroscopeSensor();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _getGyroscopeSensor(){
    gyroscopeEvents.listen((GyroscopeEvent event) {
      gx.value = event.x;
      gy.value = event.y;
      gz.value = event.z;
    });

    print('animation');
    print(gx);
    print(gy);
    print(gz);
  }

  void tourchOnOff() async {

    try {
      final isTorchAvailable = await TorchLight.isTorchAvailable();


      if(isTorchAvailable){
        if(isTourchLightOn.value ==false){
          try {
            await TorchLight.enableTorch();
            isTourchLightOn.value = true;
          } on Exception catch (_) {
            // Handle error
          }

        }else{
          try {
            await TorchLight.disableTorch();
            isTourchLightOn.value = false;
          } on Exception catch (_) {
            // Handle error
          }
        }

      }





    } on Exception catch (_) {
      // Handle error
    }
  }

  Future<void> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    id.value = androidInfo.id;
    board.value = androidInfo.board;
    bootLoader.value = androidInfo.bootloader;
    brand.value = androidInfo.brand;
    device.value = androidInfo.device;
    display.value = androidInfo.display;
    displayMetrics['heightPx'] = androidInfo.displayMetrics.heightPx;
    displayMetrics['widthPx'] = androidInfo.displayMetrics.widthPx;
    displayMetrics['xDpi'] = androidInfo.displayMetrics.xDpi;
    displayMetrics['yDpi'] = androidInfo.displayMetrics.yDpi;
    fingerPrint.value = androidInfo.fingerprint;
    hardware.value = androidInfo.hardware;
    host.value = androidInfo.host;
    isPhysicalDevice.value = androidInfo.isPhysicalDevice;
    manufacturer.value = androidInfo.manufacturer;
    model.value = androidInfo.model;
    product.value = androidInfo.product;
    tag.value = androidInfo.tags;
    types.value = androidInfo.type;
    version['baseOS'] = androidInfo.version.baseOS;
    version['codename'] = androidInfo.version.codename;
    version['previewSdkInt'] = androidInfo.version.previewSdkInt;
    version['sdkInt'] = androidInfo.version.sdkInt;
    version['securityPatch'] = androidInfo.version.securityPatch;
    data.value = androidInfo.data;



    if (await Permission.phone.request().isGranted) {
      //Either the permission was already granted before or the user just granted it.
      imeiNo.value = await DeviceInformation.deviceIMEINumber;
      cpuType.value = await DeviceInformation.cpuName;

      // bool permissionStatus = await FlutterDeviceIdentifier.checkPermission();
      //
      // if(permissionStatus){
      //   String imei = await FlutterDeviceIdentifier.imeiCode;
      //   String serial = await FlutterDeviceIdentifier.serialCode;
      //   String androidID = await FlutterDeviceIdentifier.androidID;
      //   print('hgjhgjhgjhgh');
      //   print(imei);
      //   print(serial);
      //   print(androidID);
      // }else{
      //   await FlutterDeviceIdentifier.requestPermission();
      // }
      // //






      try {
        SimData simData = await SimDataPlugin.getSimData();
        for (var s in simData.cards) {
          print('Serial number: ${s.serialNumber}');
          print('carrierName: ${s.carrierName}');
          print('countryCode: ${s.countryCode}');
          print('display name: ${s.displayName}');
          print('isDataRoaming: ${s.isDataRoaming}');
          print('isNetworkRoaming: ${s.isNetworkRoaming}');
          print('slotIndex: ${s.slotIndex}');
          print('mcc: ${s.mcc}');
          print('mnc: ${s.mnc}');
          print('subscriptionId: ${s.subscriptionId}');

        }
      } on PlatformException catch (e) {
        debugPrint("error! code: ${e.code} - message: ${e.message}");
      }

    }


    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    print('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
  }
}
