// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speed _$SpeedFromJson(Map<String, dynamic> json) => Speed(
      (json['id'] as num).toInt(),
      json['rangeInFeet'] as String,
      SpeedType.fromJson(json['speedType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpeedToJson(Speed instance) => <String, dynamic>{
      'id': instance.id,
      'rangeInFeet': instance.rangeInFeet,
      'speedType': instance.speedType,
    };
