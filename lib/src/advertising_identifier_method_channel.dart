import 'package:advertising_identifier/src/advertising_identifier_platform_interface.dart';
import 'package:advertising_identifier/src/model/advertising_id_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// An implementation of [AdvertisingIdentifierPlatform] that uses method channels.
class MethodChannelAdvertisingIdentifier extends AdvertisingIdentifierPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel =
      const MethodChannel('v7lin.github.io/advertising_identifier');

  @override
  Future<AdvertisingIdInfo> getAdvertisingIdInfo() async {
    final Map<String, dynamic>? resp = await methodChannel
        .invokeMapMethod<String, dynamic>('getAdvertisingIdInfo');
    return AdvertisingIdInfo.fromJson(resp!);
  }
}
