// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertising_id_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertisingIdInfo _$AdvertisingIdInfoFromJson(Map<String, dynamic> json) {
  return AdvertisingIdInfo(
    id: json['id'] as String?,
    isLimitAdTrackingEnabled: json['is_limit_ad_tracking_enabled'] as bool,
    authorizationStatus: _$enumDecodeNullable(
            _$AdTrackingAuthorizationStatusEnumMap,
            json['authorization_status'],
            unknownValue: AdTrackingAuthorizationStatus.notDetermined) ??
        AdTrackingAuthorizationStatus.notDetermined,
  );
}

Map<String, dynamic> _$AdvertisingIdInfoToJson(AdvertisingIdInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_limit_ad_tracking_enabled': instance.isLimitAdTrackingEnabled,
      'authorization_status':
          _$AdTrackingAuthorizationStatusEnumMap[instance.authorizationStatus],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$AdTrackingAuthorizationStatusEnumMap = {
  AdTrackingAuthorizationStatus.notDetermined: 0,
  AdTrackingAuthorizationStatus.restricted: 1,
  AdTrackingAuthorizationStatus.denied: 2,
  AdTrackingAuthorizationStatus.authorized: 3,
};
