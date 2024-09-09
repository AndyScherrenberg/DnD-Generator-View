import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/race.dart';

class RaceListItem extends StatelessWidget {
  final Race race;
  final Function onClick;
  final int index;

  const RaceListItem({super.key, required this.race, required this.onClick, required this.index});

  @override
  Widget build(BuildContext context) {
    var assetToLoad = (index.isEven)
        ? "assets/images/list-item-background-a.png"
        : "assets/images/list-item-background-b.png";
    return Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(assetToLoad), fit: BoxFit.fill)),
            child: ListTile(
              onTap: () {
                onClick();
              },
              title: Text(race.name),
            ),
          ),
        ]));
  }
}
