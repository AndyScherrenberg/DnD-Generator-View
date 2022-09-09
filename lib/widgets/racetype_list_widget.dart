import 'package:dndshower/model/race_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RaceTypeListItem extends StatelessWidget {
  final RaceType raceType;
  final Function onClick;

  const RaceTypeListItem(
      {super.key, required this.raceType, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      child: Card(
        child: ListTile(
          onTap: () {
            onClick();
          },
          title: Text(raceType.name),
          leading: CircleAvatar(),
        ),
      ),
    );
  }
}
