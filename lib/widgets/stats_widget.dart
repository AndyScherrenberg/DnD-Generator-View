import 'package:dndshower/model/collected_stats.dart';
import 'package:dndshower/widgets/stat_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsWidget extends StatelessWidget {
  final CollectedStats collectedStats;

  const StatsWidget({super.key, required this.collectedStats});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          StatWidget(name: "STR", stat: collectedStats.strength),
          StatWidget(name: "DEX", stat: collectedStats.dexterity),
          StatWidget(name: "CON", stat: collectedStats.constitution),
        ]),
        const Divider(
          color: Color(0x00000000),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          StatWidget(name: "INT", stat: collectedStats.intelligence),
          StatWidget(name: "WIS", stat: collectedStats.wisdom),
          StatWidget(name: "CHA", stat: collectedStats.charisma),
        ]),
      ],
    );
  }
}
