import 'package:json_annotation/json_annotation.dart';

part 'advertising_id_info.g.dart';

enum AdTrackingAuthorizationStatus {
  @JsonValue(0)
  notDetermined,
  @JsonValue(1)
  restricted,
  @JsonValue(2)
  denied,
  @JsonValue(3)
  authorized
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class AdvertisingIdInfo {
  const AdvertisingIdInfo({
    required this.id,
    required this.isLimitAdTrackingEnabled,
    required this.authorizationStatus,
  });

  factory AdvertisingIdInfo.fromJson(Map<String, dynamic> json) =>
      _$AdvertisingIdInfoFromJson(json);

  /// advertising id (IDFA for iOS, GAID for Android)
  final String? id;

  /// if user has limited Ad tracking or not.
  final bool isLimitAdTrackingEnabled;

  /// authorization status by users. (mainly for iOS14)
  @JsonKey(
    defaultValue: AdTrackingAuthorizationStatus.notDetermined,
    unknownEnumValue: AdTrackingAuthorizationStatus.notDetermined,
  )
  final AdTrackingAuthorizationStatus authorizationStatus;

  Map<String, dynamic> toJson() => _$AdvertisingIdInfoToJson(this);
}
