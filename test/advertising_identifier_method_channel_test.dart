import 'package:advertising_identifier/src/advertising_identifier_method_channel.dart';
import 'package:advertising_identifier/src/model/advertising_id_info.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final MethodChannelAdvertisingIdentifier platform =
      MethodChannelAdvertisingIdentifier();
  const MethodChannel channel =
      MethodChannel('v7lin.github.io/advertising_identifier');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'getAdvertisingIdInfo':
          return AdvertisingIdInfo(
            isLimitAdTrackingEnabled: true,
            authorizationStatus: AdTrackingAuthorizationStatus.denied,
          ).toJson();
      }
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getAdvertisingIdInfo', () async {
    final AdvertisingIdInfo info = await platform.getAdvertisingIdInfo();
    expect(info.isLimitAdTrackingEnabled, true);
  });
}
