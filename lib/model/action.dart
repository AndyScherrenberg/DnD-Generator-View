import 'package:json_annotation/json_annotation.dart';

import 'action_type.dart';
import 'damage_type.dart';
import 'modifier.dart';

part 'action.g.dart';

@JsonSerializable()
class Action {
  int? id;
  String name;
  String? reach;
  String? target;

  String? hitDice;
  int? toHit;
  int? hitBonus;

  ActionType actionType;
  DamageType? damageType;
  List<Modifier>? modifiers;

  String? specialInformation;
  bool weaponAttack;

  @JsonKey(ignore: true)
  bool isSelected = false;

  Action(
      this.id,
      this.name,
      this.reach,
      this.target,
      this.hitDice,
      this.toHit,
      this.hitBonus,
      this.actionType,
      this.damageType,
      this.modifiers,
      this.specialInformation,
      this.weaponAttack);

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);
}
