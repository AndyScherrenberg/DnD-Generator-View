import 'package:json_annotation/json_annotation.dart';

part 'challenge_rating.g.dart';

@JsonSerializable()
class ChallengeRating {
  int id;
  String rating;
  int xp;

  ChallengeRating(this.id, this.rating, this.xp);

  factory ChallengeRating.fromJson(Map<String, dynamic> json) =>
      _$ChallengeRatingFromJson(json);

  String? asString(){
    return "$rating ($xp)";
  }
}
