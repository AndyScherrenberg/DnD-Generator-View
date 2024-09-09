import 'package:dndshower/model/collected_stats.dart';
import 'package:dndshower/widgets/default/spacer.dart';
import 'package:dndshower/widgets/stat_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsWidget extends StatelessWidget {
  final CollectedStats collectedStats;

  const StatsWidget({super.key, required this.collectedStats});

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 300;

    return Flex(
        direction: isScreenWide ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StatWidget(name: "STR", stat: collectedStats.strength),
          StatWidget(name: "DEX", stat: collectedStats.dexterity),
          StatWidget(name: "CON", stat: collectedStats.constitution),
          StatWidget(name: "INT", stat: collectedStats.intelligence),
          StatWidget(name: "WIS", stat: collectedStats.wisdom),
          StatWidget(name: "CHA", stat: collectedStats.charisma),
        ].withSpaceBetween(width: 10));
  }
}
