import 'package:json_annotation/json_annotation.dart';

import 'action_type.dart';
import 'damage_type.dart';
import 'modifier.dart';

part 'calculated_stats.g.dart';

@JsonSerializable()
class CalculatedStats {
  int? id;
  String name;
  int value;

  CalculatedStats(this.id, this.name, this.value);

  factory CalculatedStats.fromJson(Map<String, dynamic> json) =>
      _$CalculatedStatsFromJson(json);
}
