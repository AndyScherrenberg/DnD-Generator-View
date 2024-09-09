// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaceType _$RaceTypeFromJson(Map<String, dynamic> json) => RaceType(
      (json['id'] as num).toInt(),
      json['name'] as String,
    );

Map<String, dynamic> _$RaceTypeToJson(RaceType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
