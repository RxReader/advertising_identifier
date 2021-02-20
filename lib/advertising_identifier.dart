import 'dart:async';

import 'package:flutter/services.dart';

class AdvertisingIdentifier {
  const AdvertisingIdentifier._();

  static const MethodChannel _channel = MethodChannel('v7lin.github.io/advertising_identifier');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
