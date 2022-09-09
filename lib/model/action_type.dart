import 'package:json_annotation/json_annotation.dart';

part 'action_type.g.dart';

@JsonSerializable()
class ActionType {
  String name;

  ActionType(this.name);

  factory ActionType.fromJson(Map<String, dynamic> json) =>
      _$ActionTypeFromJson(json);
}
