import 'package:advertising_identifier/src/advertising_identifier.dart';
import 'package:advertising_identifier/src/advertising_identifier_method_channel.dart';
import 'package:advertising_identifier/src/advertising_identifier_platform_interface.dart';
import 'package:advertising_identifier/src/model/advertising_id_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAdvertisingIdentifierPlatform
    with MockPlatformInterfaceMixin
    implements AdvertisingIdentifierPlatform {
  @override
  Future<AdvertisingIdInfo> getAdvertisingIdInfo() {
    return Future<AdvertisingIdInfo>.value(AdvertisingIdInfo(
      isLimitAdTrackingEnabled: true,
      authorizationStatus: AdTrackingAuthorizationStatus.denied,
    ));
  }
}

void main() {
  final AdvertisingIdentifierPlatform initialPlatform =
      AdvertisingIdentifierPlatform.instance;

  test('$MethodChannelAdvertisingIdentifier is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAdvertisingIdentifier>());
  });

  test('getPlatformVersion', () async {
    final MockAdvertisingIdentifierPlatform fakePlatform =
        MockAdvertisingIdentifierPlatform();
    AdvertisingIdentifierPlatform.instance = fakePlatform;

    final AdvertisingIdInfo info =
        await AdvertisingIdentifier.instance.getAdvertisingIdInfo();
    expect(info.isLimitAdTrackingEnabled, true);
  });
}
