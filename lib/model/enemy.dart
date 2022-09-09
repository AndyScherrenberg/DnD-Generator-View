import 'package:dndshower/model/collected_stats.dart';
import 'package:dndshower/model/race_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enemy.g.dart';

@JsonSerializable()
class Enemy {
  int id;
  String name;

  RaceType raceType;
  CollectedStats baseStats;

  Enemy(this.id, this.name, this.raceType, this.baseStats);

  factory Enemy.fromJson(Map<String, dynamic> json) => _$EnemyFromJson(json);
}
