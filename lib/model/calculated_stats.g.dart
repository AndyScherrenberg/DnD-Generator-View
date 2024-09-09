// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculated_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalculatedStats _$CalculatedStatsFromJson(Map<String, dynamic> json) =>
    CalculatedStats(
      (json['id'] as num?)?.toInt(),
      json['name'] as String,
      (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$CalculatedStatsToJson(CalculatedStats instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
    };
