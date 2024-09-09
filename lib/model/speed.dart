import 'package:dndshower/model/speed_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'speed.g.dart';

@JsonSerializable()
class Speed {
  int id;
  String rangeInFeet;
  SpeedType speedType;

  Speed(this.id, this.rangeInFeet, this.speedType);

  factory Speed.fromJson(Map<String, dynamic> json) => _$SpeedFromJson(json);
}
