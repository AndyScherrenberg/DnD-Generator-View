import 'package:json_annotation/json_annotation.dart';

import 'stat.dart';

part 'collected_stats.g.dart';

@JsonSerializable()
class CollectedStats {
  Stat wisdom;
  Stat charisma;
  Stat constitution;
  Stat dexterity;
  Stat intelligence;
  Stat strength;

  CollectedStats(this.wisdom, this.charisma, this.constitution, this.dexterity,
      this.intelligence, this.strength);

  factory CollectedStats.fromJson(Map<String, dynamic> json) =>
      _$CollectedStatsFromJson(json);
}
