// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collected_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectedStats _$CollectedStatsFromJson(Map<String, dynamic> json) =>
    CollectedStats(
      Stat.fromJson(json['wisdom'] as Map<String, dynamic>),
      Stat.fromJson(json['charisma'] as Map<String, dynamic>),
      Stat.fromJson(json['constitution'] as Map<String, dynamic>),
      Stat.fromJson(json['dexterity'] as Map<String, dynamic>),
      Stat.fromJson(json['intelligence'] as Map<String, dynamic>),
      Stat.fromJson(json['strength'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CollectedStatsToJson(CollectedStats instance) =>
    <String, dynamic>{
      'wisdom': instance.wisdom,
      'charisma': instance.charisma,
      'constitution': instance.constitution,
      'dexterity': instance.dexterity,
      'intelligence': instance.intelligence,
      'strength': instance.strength,
    };
