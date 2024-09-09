import 'package:dndshower/theme.dart';
import 'package:flutter/material.dart';

import '../../model/speed.dart';

class StatBlockBaseInfo extends StatelessWidget {
  final String? ac;
  final int? hitPoints;
  final String? hitDice;
  final List<Speed>? speed;

  const StatBlockBaseInfo({super.key, this.ac, this.hitPoints,this.hitDice, this.speed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
          style: statBookTextStyle(Theme.of(context).textTheme).bodyMedium,
          children: [
            TextSpan(
                text: 'Armor Class ',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:  ac),
          ],
        )),
        RichText(
            text: TextSpan(
              style:  statBookTextStyle(Theme.of(context).textTheme).bodyMedium,
          children: [
            TextSpan(
                text: 'Hit Points ',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "$hitDice ($hitPoints)"),
          ],
        )),
        RichText(
            text: TextSpan(
              style:  statBookTextStyle(Theme.of(context).textTheme).bodyMedium,
          children: [
            TextSpan(
                text: 'Speed ',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text:
                speed?.map((s)  => s.rangeInFeet).join(", ")

            ),
          ],
        ))
      ],
    );
  }
}
