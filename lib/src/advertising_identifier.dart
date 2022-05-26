import 'package:advertising_identifier/src/advertising_identifier_platform_interface.dart';

class AdvertisingIdentifier {
  const AdvertisingIdentifier._();

  static AdvertisingIdentifierPlatform get instance =>
      AdvertisingIdentifierPlatform.instance;
}
