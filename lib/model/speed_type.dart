import 'package:json_annotation/json_annotation.dart';

part 'speed_type.g.dart';

@JsonSerializable()
class SpeedType {
  int id;
  String name;


  SpeedType(this.id, this.name);

  factory SpeedType.fromJson(Map<String, dynamic> json) => _$SpeedTypeFromJson(json);
}
