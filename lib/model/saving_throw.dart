import 'package:json_annotation/json_annotation.dart';

part 'saving_throw.g.dart';

@JsonSerializable()
class SavingThrow {
  int id;
  String name;
  int value;

  SavingThrow(this.id, this.name, this.value);

  String asString(){
    return "$name +$value";
  }

  factory SavingThrow.fromJson(Map<String, dynamic> json) =>
      _$SavingThrowFromJson(json);
}
