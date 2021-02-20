import 'dart:async';

import 'package:advertising_identifier/src/model/advertising_id_info.dart';
import 'package:flutter/services.dart';

class AdvertisingIdManager {
  const AdvertisingIdManager._();

  static const MethodChannel _channel =
      MethodChannel('v7lin.github.io/advertising_identifier');

  static Future<AdvertisingIdInfo> getAdvertisingIdInfo() async {
    final Map<String, dynamic> resp =
        await _channel.invokeMapMethod<String, dynamic>('getAdvertisingIdInfo');
    return AdvertisingIdInfo.fromJson(resp);
  }
}
