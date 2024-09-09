// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Combine _$CombineFromJson(Map<String, dynamic> json) => Combine(
      json['name'] as String,
      json['raceName'] as String,
      CollectedStats.fromJson(json['combinedStats'] as Map<String, dynamic>),
      json['raceType'] as String,
      (json['actions'] as List<dynamic>?)
          ?.map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['speed'] as List<dynamic>?)
          ?.map((e) => Speed.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['armorClass'] as String,
      Size.fromJson(json['size'] as Map<String, dynamic>),
      (json['proficiencyBonus'] as num).toInt(),
      json['hitDice'] as String,
      (json['reactions'] as List<dynamic>?)
          ?.map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['calculatedSavingThrows'] as List<dynamic>?)
          ?.map((e) => SavingThrow.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['defaultHitPoints'] as num).toInt(),
      json['alignment'] as String?,
      (json['languages'] as List<dynamic>?)
          ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['traits'] as List<dynamic>?)
          ?.map((e) => Trait.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['challengeRating'] == null
          ? null
          : ChallengeRating.fromJson(
              json['challengeRating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CombineToJson(Combine instance) => <String, dynamic>{
      'name': instance.name,
      'raceName': instance.raceName,
      'combinedStats': instance.combinedStats,
      'raceType': instance.raceType,
      'speed': instance.speed,
      'armorClass': instance.armorClass,
      'size': instance.size,
      'proficiencyBonus': instance.proficiencyBonus,
      'actions': instance.actions,
      'reactions': instance.reactions,
      'hitDice': instance.hitDice,
      'defaultHitPoints': instance.defaultHitPoints,
      'alignment': instance.alignment,
      'calculatedSavingThrows': instance.calculatedSavingThrows,
      'languages': instance.languages,
      'traits': instance.traits,
      'challengeRating': instance.challengeRating,
    };
