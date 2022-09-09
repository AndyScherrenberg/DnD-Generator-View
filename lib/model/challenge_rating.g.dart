// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeRating _$ChallengeRatingFromJson(Map<String, dynamic> json) =>
    ChallengeRating(
      json['id'] as int,
      json['rating'] as String,
      json['xp'] as int,
    );

Map<String, dynamic> _$ChallengeRatingToJson(ChallengeRating instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'xp': instance.xp,
    };
