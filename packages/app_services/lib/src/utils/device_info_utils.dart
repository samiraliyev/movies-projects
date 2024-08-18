import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoUtils {
  DeviceInfoUtils._();

  static Future<BaseDeviceInfo> getInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      log('Id: ${androidInfo.id}');
      log('serialNumber: ${androidInfo.serialNumber}');
      log('Device: ${androidInfo.device}');
      log('Model: ${androidInfo.model}');
      log('Product: ${androidInfo.product}');
      log('Type: ${androidInfo.type}');
      log('Version: ${androidInfo.version}');
      log('Board: ${androidInfo.board}');
      log('Brand: ${androidInfo.brand}');
      log('Host: ${androidInfo.host}');
      log('Manufacturer: ${androidInfo.manufacturer}');
      log('Tags: ${androidInfo.tags}');
      log('isPhysicalDevice: ${androidInfo.isPhysicalDevice}');
      return androidInfo;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      log('IMEI: ${iosInfo.identifierForVendor}');
      log('Device Name: ${iosInfo.name}');
      log('Model: ${iosInfo.model}');
      log('System Name: ${iosInfo.systemName}');
      log('System Version: ${iosInfo.systemVersion}');
      log('machine: ${iosInfo.utsname.machine}');
      log('sysName: ${iosInfo.utsname.sysname}');
      log('release: ${iosInfo.utsname.release}');
      log('version: ${iosInfo.utsname.version}');
      log('nodeName: ${iosInfo.utsname.nodename}');
      log('localizedModel: ${iosInfo.localizedModel}');
      log('isPhysicalDevice: ${iosInfo.isPhysicalDevice}');
      return iosInfo;
    }
  }
}
