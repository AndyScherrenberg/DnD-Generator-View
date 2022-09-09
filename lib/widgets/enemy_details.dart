import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/enemy.dart';

class EnemyDetails extends StatelessWidget {
  final Enemy enemy;

  const EnemyDetails({super.key, required this.enemy});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      child: Card(
        child: Column(children: [
          ListTile(
            title: Text(enemy.name),
          ),
          Row(
            children: [
              Text("STR:${enemy.name}"),
              Text("DEX:${enemy.name}"),
              Text("CON:${enemy.name}"),
              Text("INT:${enemy.name}"),
              Text("WIS:${enemy.name}"),
              Text("CHA:${enemy.name}")
            ],
          )
        ]),
      ),
    );
  }
}
