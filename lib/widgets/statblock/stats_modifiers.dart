import 'package:dndshower/model/calculated_stats.dart';
import 'package:dndshower/model/challenge_rating.dart';
import 'package:dndshower/model/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/saving_throw.dart';
import '../../theme.dart';

class StatsModifiers extends StatelessWidget {
  final List<Language>? languages;
  final int? proficiencyBonus;
  final ChallengeRating? challengeRating;
  final List<SavingThrow>? calculatedStats;

  const StatsModifiers(
      {super.key, this.languages, this.proficiencyBonus, this.challengeRating, this.calculatedStats});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        createTextField(context, "Saving Throws", calculatedStats?.map((cs) => cs.asString()).join(", ")),
        createTextField(context, "Skills", null),
        createTextField(context, "Senses", null),
        createTextField(context, "Languages",
            languages?.map((language) => language.name).join(", ")),
        createTextField(context, "Saving Throws", null),
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              createTextField(
                  context, "Challenge Rating", challengeRating?.asString()),
              createTextField(
                  context, "Proficiency Bonus", "+$proficiencyBonus"),
            ]),
      ],
    );
  }

  Widget createTextField(BuildContext context, String title, String? value) {
    if (value == null || value.isEmpty) {
      return Container();
    }

    return RichText(
        text: TextSpan(
      style: statBookTextStyle(Theme.of(context).textTheme).bodyMedium,
      children: [
        TextSpan(
            text: title , style: const TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: " $value"),
      ],
    ));
  }
}
