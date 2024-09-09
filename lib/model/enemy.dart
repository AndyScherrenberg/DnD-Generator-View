import 'package:dndshower/model/calculated_stats.dart';
import 'package:dndshower/model/challenge_rating.dart';
import 'package:dndshower/model/collected_stats.dart';
import 'package:dndshower/model/language.dart';
import 'package:dndshower/model/race_type.dart';
import 'package:dndshower/model/saving_throw.dart';
import 'package:dndshower/model/size.dart';
import 'package:dndshower/model/speed.dart';
import 'package:dndshower/model/trait.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:dndshower/model/action.dart';

part 'enemy.g.dart';

@JsonSerializable()
class Enemy {
  int id;
  String name;

  String alignment;

  String ac;
  String hitDice;
  int defaultHitPoints;

  RaceType raceType;
  CollectedStats baseStats;

  ChallengeRating challengeRating;

  List<Language>? languages = List.empty();
  List<Speed>? speed = List.empty();
  List<SavingThrow>? calculatedSavingThrows = List.empty();

  List<Action>? calculatedActions = List.empty();
  List<Action>? calculatedReactions = List.empty();
  List<Trait>? readableTraits = List.empty();

  Size size;

  int proficiencyBonus;

  Enemy(
      this.id,
      this.name,
      this.raceType,
      this.baseStats,
      this.speed,
      this.ac,
      this.alignment,
      this.hitDice,
      this.defaultHitPoints,
      this.challengeRating,
      this.languages,
      this.proficiencyBonus,
      this.calculatedSavingThrows,
      this.size,
      this.calculatedActions,
      this.calculatedReactions,
      this.readableTraits);

  factory Enemy.fromJson(Map<String, dynamic> json) => _$EnemyFromJson(json);
}
