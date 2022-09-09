import 'package:dndshower/model/language.dart';
import 'package:dndshower/model/saving_throw.dart';
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

  String speed;
  String armorClass;
  Size size;
  int proficiencyBonus;
  List<Action>? calculatedActions = List.empty();
  List<Action>? calculatedReactions = List.empty();

  String hitDice;
  int defaultHitPoints;

  String? alignment;

  List<SavingThrow>? calculatedSavingThrows = List.empty();
  List<Language>? languages = List.empty();
  List<Trait>? readableTraits = List.empty();

  ChallengeRating? challengeRating;

  Combine(
      this.name,
      this.raceName,
      this.combinedStats,
      this.raceType,
      this.calculatedActions,
      this.speed,
      this.armorClass,
      this.size,
      this.proficiencyBonus,
      this.hitDice,
      this.calculatedReactions,
      this.calculatedSavingThrows,
      this.defaultHitPoints,
      this.alignment,
      this.languages,
      this.readableTraits,
      this.challengeRating);

  factory Combine.fromJson(Map<String, dynamic> json) =>
      _$CombineFromJson(json);
}
