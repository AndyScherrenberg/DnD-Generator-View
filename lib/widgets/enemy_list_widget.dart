import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/enemy.dart';

class EnemyListItem extends StatelessWidget {
  final Enemy enemy;
  final Function onClick;

  const EnemyListItem({super.key, required this.enemy, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      child: Card(
        child: ListTile(
          onTap: () {
            onClick();
          },
          title: Text(enemy.name),
          leading: CircleAvatar(),
        ),
      ),
    );
  }
}
