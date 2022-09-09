import 'package:json_annotation/json_annotation.dart';

part 'modifier.g.dart';

@JsonSerializable()
class Modifier {
  int id;
  String modifier;

  Modifier(this.id, this.modifier);

  factory Modifier.fromJson(Map<String, dynamic> json) =>
      _$ModifierFromJson(json);
}
