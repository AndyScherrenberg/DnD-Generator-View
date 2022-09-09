import 'package:json_annotation/json_annotation.dart';

part 'trait.g.dart';

@JsonSerializable()
class Trait {
  int id;
  String? name;
  String? description;

  @JsonKey(ignore: true)
  bool isSelected = false;

  Trait(this.id, this.name, this.description);

  factory Trait.fromJson(Map<String, dynamic> json) => _$TraitFromJson(json);
}
