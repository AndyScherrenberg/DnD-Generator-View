import 'package:dndshower/model/language.dart';
import 'package:dndshower/model/saving_throw.dart';
import 'package:dndshower/model/speed.dart';
import 'package:dndshower/model/trait.dart';
import 'package:json_annotation/json_annotation.dart';

import 'action.dart';
import 'challenge_rating.dart';
import 'collected_stats.dart';
import 'size.dart';

part 'combine.g.dart';

@JsonSerializable()
class Combine {
  String name;
  String raceName;
  CollectedStats combinedStats;
  String raceType;

  List<Speed>? speed = List.empty();
  String armorClass;
  Size size;
  int proficiencyBonus;
  List<Action>? actions = List.empty();
  List<Action>? reactions = List.empty();

  String hitDice;
  int defaultHitPoints;

  String? alignment;

  List<SavingThrow>? calculatedSavingThrows = List.empty();
  List<Language>? languages = List.empty();
  List<Trait>? traits = List.empty();

  ChallengeRating? challengeRating;

  Combine(
      this.name,
      this.raceName,
      this.combinedStats,
      this.raceType,
      this.actions,
      this.speed,
      this.armorClass,
      this.size,
      this.proficiencyBonus,
      this.hitDice,
      this.reactions,
      this.calculatedSavingThrows,
      this.defaultHitPoints,
      this.alignment,
      this.languages,
      this.traits,
      this.challengeRating);

  factory Combine.fromJson(Map<String, dynamic> json) =>
      _$CombineFromJson(json);
}
