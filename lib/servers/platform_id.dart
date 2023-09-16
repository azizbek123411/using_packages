import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

import 'log_servises.dart';

class PlatformId {
  static Future<dynamic> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo.androidId;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor;
      }
    } catch (e) {
      LogService.i(e.toString());
    }
  }
}