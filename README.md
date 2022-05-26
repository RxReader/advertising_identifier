# advertising_identifier

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
