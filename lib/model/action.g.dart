// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) => Action(
      (json['id'] as num?)?.toInt(),
      json['name'] as String,
      json['reach'] as String?,
      json['target'] as String?,
      json['hitDice'] as String?,
      (json['toHit'] as num?)?.toInt(),
      (json['hitBonus'] as num?)?.toInt(),
      ActionType.fromJson(json['actionType'] as Map<String, dynamic>),
      json['damageType'] == null
          ? null
          : DamageType.fromJson(json['damageType'] as Map<String, dynamic>),
      (json['modifiers'] as List<dynamic>?)
          ?.map((e) => Modifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['specialInformation'] as String?,
      json['weaponAttack'] as bool,
    );

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'reach': instance.reach,
      'target': instance.target,
      'hitDice': instance.hitDice,
      'toHit': instance.toHit,
      'hitBonus': instance.hitBonus,
      'actionType': instance.actionType,
      'damageType': instance.damageType,
      'modifiers': instance.modifiers,
      'specialInformation': instance.specialInformation,
      'weaponAttack': instance.weaponAttack,
    };
