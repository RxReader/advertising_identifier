import 'package:advertising_identifier/src/advertising_identifier_method_channel.dart';
import 'package:advertising_identifier/src/model/advertising_id_info.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class AdvertisingIdentifierPlatform extends PlatformInterface {
  /// Constructs a AdvertisingIdentifierPlatform.
  AdvertisingIdentifierPlatform() : super(token: _token);

  static final Object _token = Object();

  static AdvertisingIdentifierPlatform _instance =
      MethodChannelAdvertisingIdentifier();

  /// The default instance of [AdvertisingIdentifierPlatform] to use.
  ///
  /// Defaults to [MethodChannelAdvertisingIdentifier].
  static AdvertisingIdentifierPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AdvertisingIdentifierPlatform] when
  /// they register themselves.
  static set instance(AdvertisingIdentifierPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<AdvertisingIdInfo> getAdvertisingIdInfo() async {
    throw UnimplementedError(
        'getAdvertisingIdInfo() has not been implemented.');
  }
}
