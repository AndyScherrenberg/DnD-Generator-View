// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enemy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Enemy _$EnemyFromJson(Map<String, dynamic> json) => Enemy(
      json['id'] as int,
      json['name'] as String,
      RaceType.fromJson(json['raceType'] as Map<String, dynamic>),
      CollectedStats.fromJson(json['baseStats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EnemyToJson(Enemy instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'raceType': instance.raceType,
      'baseStats': instance.baseStats,
    };
