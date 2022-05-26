# advertising_identifier

[![Pub Package](https://img.shields.io/pub/v/advertising_identifier.svg)](https://pub.dev/packages/advertising_identifier)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/RxReader/advertising_identifier/blob/master/LICENSE)

Flutter plugin for Advertising Identifier.

```dart
try {
  final AdvertisingIdInfo info =
      await AdvertisingIdManager.getAdvertisingIdInfo();
  print(json.encode(info));
} on PlatformException catch (e) {
  print(e);
}
```
