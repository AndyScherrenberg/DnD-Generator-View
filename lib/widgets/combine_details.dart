import 'package:dndshower/extension/string_extension.dart';
import 'package:dndshower/model/challenge_rating.dart';
import 'package:dndshower/widgets/default/default_divider.dart';
import 'package:dndshower/widgets/stats_widget.dart';
import 'package:dndshower/widgets/title_widget.dart';
import 'package:dndshower/widgets/trait_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/combine.dart';
import 'action_widget.dart';

class CombineDetails extends StatelessWidget {
  final Combine combine;

  const CombineDetails({super.key, required this.combine});

  @override
  Widget build(BuildContext context) {
    var pwdWidgets = <Widget>[];

    pwdWidgets.add(Text(combine.name, style: TextStyle(fontSize: 24)));

    pwdWidgets.add(Text(
        "${combine.size.size.capitalize()} ${combine.raceType} (${combine.raceName}), ${combine.alignment}"));

    pwdWidgets.add(const DefaultDivider());

    pwdWidgets
        .add(TitleWidget(title: "Armor Class", value: combine.armorClass));
    pwdWidgets.add(TitleWidget(
        title: "Hit Points",
        value: "${combine.defaultHitPoints} ${combine.hitDice}"));
    pwdWidgets.add(TitleWidget(title: "Speed", value: combine.speed));
    pwdWidgets.add(const DefaultDivider());
    pwdWidgets.add(StatsWidget(collectedStats: combine.combinedStats));
    pwdWidgets.add(const DefaultDivider());

    if (combine.calculatedSavingThrows?.isNotEmpty == true) {
      String savingThrows = combine.calculatedSavingThrows
              ?.map(
                  (savingThrow) => "${savingThrow.name} +${savingThrow.value}")
              .join(", ") ??
          "";
      if (savingThrows.isNotEmpty) {
        pwdWidgets
            .add(TitleWidget(title: "Saving Throws", value: savingThrows));
      }
    }

    String languages =
        combine.languages?.map((language) => language.name).join(", ") ?? "";

    pwdWidgets.add(TitleWidget(title: "Senses", value: "none"));

    if (languages.isNotEmpty) {
      pwdWidgets.add(TitleWidget(title: "Languages", value: languages));
    }

    if (combine.challengeRating != null) {
      ChallengeRating challengeRating =
          combine.challengeRating ?? ChallengeRating(0, "", 0);
      pwdWidgets.add(TitleWidget(
          title: "Challenge",
          value: "${challengeRating.rating} (${challengeRating.xp}xp)"));
    }
    pwdWidgets.add(TitleWidget(
        title: "Proficiency Bonus", value: "+${combine.proficiencyBonus}"));

    if (combine.readableTraits?.isNotEmpty == true) {
      pwdWidgets.add(const Divider(color: Colors.black));
      pwdWidgets.add(TraitWidget(
        title: "Traits",
        traits: combine.readableTraits!,
      ));
    }

    if (combine.calculatedActions?.isNotEmpty == true) {
      pwdWidgets.add(const Divider(color: Colors.black));
      pwdWidgets.add(ActionWidget(
          title: "Actions", calculatedActions: combine.calculatedActions!));
    }

    if (combine.calculatedReactions?.isNotEmpty == true) {
      pwdWidgets.add(const Divider(color: Colors.black));
      pwdWidgets.add(ActionWidget(
          title: "Reactions", calculatedActions: combine.calculatedReactions!));
    }

    return Expanded(
        child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(15.0),
            children: pwdWidgets));
  }
}
