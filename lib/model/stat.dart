import 'package:json_annotation/json_annotation.dart';

part 'stat.g.dart';

@JsonSerializable()
class Stat {
  int baseStat;
  int modifier;

  Stat(this.baseStat, this.modifier);

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}
