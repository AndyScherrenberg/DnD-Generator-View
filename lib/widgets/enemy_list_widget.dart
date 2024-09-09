import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/enemy.dart';
import 'enemy_details.dart';

class EnemyListItem extends StatelessWidget {
  final Enemy enemy;
  final int index;
  final Function onClick;
  final bool isSelected;

  const EnemyListItem(
      {super.key,
      required this.enemy,
      required this.index,
      required this.onClick,
      required this.isSelected});

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
              title: Text(enemy.name),
            ),
          ),
          Container(
              child: isSelected
                  ? EnemyDetails(enemy: enemy)
                  : Container()),
        ]));
  }
}
