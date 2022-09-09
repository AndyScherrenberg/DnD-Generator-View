import 'package:json_annotation/json_annotation.dart';

part 'damage_type.g.dart';

@JsonSerializable()
class DamageType {
  String name;

  DamageType(this.name);

  factory DamageType.fromJson(Map<String, dynamic> json) =>
      _$DamageTypeFromJson(json);
}
