import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/race.dart';

class RaceListItem extends StatelessWidget {
  final Race race;
  final Function onClick;

  const RaceListItem({super.key, required this.race, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      child: Card(
        child: ListTile(
          onTap: () {
            onClick();
          },
          title: Text(race.name),
          leading: CircleAvatar(),
        ),
      ),
    );
  }
}
