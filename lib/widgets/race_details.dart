import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/race.dart';

class RaceDetails extends StatelessWidget {
  final Race race;

  const RaceDetails({super.key, required this.race});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      child: Card(
        child: Column(children: [
          ListTile(
            title: Text(race.name),
          ),
          Row(
            children: [
              Text("STR:${race.name}"),
              Text("DEX:${race.name}"),
              Text("CON:${race.name}"),
              Text("INT:${race.name}"),
              Text("WIS:${race.name}"),
              Text("CHA:${race.name}")
            ],
          )
        ]),
      ),
    );
  }
}
