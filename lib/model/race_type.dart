import 'package:json_annotation/json_annotation.dart';

part 'race_type.g.dart';

@JsonSerializable()
class RaceType {
  int id;
  String name;

  @JsonKey(ignore: true)
  bool isHumanoid = false;

  RaceType(this.id, this.name);

  factory RaceType.fromJson(Map<String, dynamic> json) =>
      _$RaceTypeFromJson(json);
}
