import 'package:json_annotation/json_annotation.dart';

part 'race.g.dart';

@JsonSerializable()
class Race {
  int id;
  String name;

  Race(this.id, this.name);

  factory Race.fromJson(Map<String, dynamic> json) => _$RaceFromJson(json);
}
