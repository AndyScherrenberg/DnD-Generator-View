// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enemy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Enemy _$EnemyFromJson(Map<String, dynamic> json) => Enemy(
      (json['id'] as num).toInt(),
      json['name'] as String,
      RaceType.fromJson(json['raceType'] as Map<String, dynamic>),
      CollectedStats.fromJson(json['baseStats'] as Map<String, dynamic>),
      (json['speed'] as List<dynamic>?)
          ?.map((e) => Speed.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['ac'] as String,
      json['alignment'] as String,
      json['hitDice'] as String,
      (json['defaultHitPoints'] as num).toInt(),
      ChallengeRating.fromJson(json['challengeRating'] as Map<String, dynamic>),
      (json['languages'] as List<dynamic>?)
          ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['proficiencyBonus'] as num).toInt(),
      (json['calculatedSavingThrows'] as List<dynamic>?)
          ?.map((e) => SavingThrow.fromJson(e as Map<String, dynamic>))
          .toList(),
      Size.fromJson(json['size'] as Map<String, dynamic>),
      (json['calculatedActions'] as List<dynamic>?)
          ?.map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['calculatedReactions'] as List<dynamic>?)
          ?.map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['readableTraits'] as List<dynamic>?)
          ?.map((e) => Trait.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EnemyToJson(Enemy instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alignment': instance.alignment,
      'ac': instance.ac,
      'hitDice': instance.hitDice,
      'defaultHitPoints': instance.defaultHitPoints,
      'raceType': instance.raceType,
      'baseStats': instance.baseStats,
      'challengeRating': instance.challengeRating,
      'languages': instance.languages,
      'speed': instance.speed,
      'calculatedSavingThrows': instance.calculatedSavingThrows,
      'calculatedActions': instance.calculatedActions,
      'calculatedReactions': instance.calculatedReactions,
      'readableTraits': instance.readableTraits,
      'size': instance.size,
      'proficiencyBonus': instance.proficiencyBonus,
    };
