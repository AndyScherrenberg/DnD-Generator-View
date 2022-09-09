import 'package:dndshower/lists/future_enemy_list.dart';
import 'package:dndshower/model/enemy.dart';
import 'package:dndshower/service/enemy_service.dart';
import 'package:flutter/material.dart';

import '../widgets/enemy_details.dart';

class ChooseEnemy extends StatefulWidget {
  @override
  _ChooseEnemyState createState() => _ChooseEnemyState();
}

class _ChooseEnemyState extends State<ChooseEnemy> {
  EnemyService enemyService = EnemyService();

  Enemy? currentEnemy;

  late Future<List<Enemy>> futureData;

  void updateEnemy(Enemy instance) async {
    currentEnemy = instance;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    futureData = enemyService.getEnemies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pick a Race'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(children: [
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.6),
              child: FutureEnemyList(
                futureData: futureData,
                onEnemyClicked: updateEnemy,
                shrinkWrapping: true,
                searchQuery: "",
              )),
          Container(
              child: currentEnemy != null
                  ? EnemyDetails(enemy: currentEnemy!)
                  : Container())
        ]));
  }
}
