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
      (json['calculatedActions'] as List<dynamic>?)
          ?.map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['speed'] as String,
      json['armorClass'] as String,
      Size.fromJson(json['size'] as Map<String, dynamic>),
      json['proficiencyBonus'] as int,
      json['hitDice'] as String,
      (json['calculatedReactions'] as List<dynamic>?)
          ?.map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['calculatedSavingThrows'] as List<dynamic>?)
          ?.map((e) => SavingThrow.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['defaultHitPoints'] as int,
      json['alignment'] as String?,
      (json['languages'] as List<dynamic>?)
          ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['readableTraits'] as List<dynamic>?)
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
      'calculatedActions': instance.calculatedActions,
      'calculatedReactions': instance.calculatedReactions,
      'hitDice': instance.hitDice,
      'defaultHitPoints': instance.defaultHitPoints,
      'alignment': instance.alignment,
      'calculatedSavingThrows': instance.calculatedSavingThrows,
      'languages': instance.languages,
      'readableTraits': instance.readableTraits,
      'challengeRating': instance.challengeRating,
    };
