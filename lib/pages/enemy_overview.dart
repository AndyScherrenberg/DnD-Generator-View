import 'package:dndshower/lists/future_enemy_list.dart';
import 'package:dndshower/model/enemy.dart';
import 'package:dndshower/service/enemy_service.dart';
import 'package:dndshower/widgets/default/default_divider.dart';
import 'package:dndshower/widgets/default/spacer.dart';
import 'package:dndshower/widgets/main_container.dart';
import 'package:flutter/material.dart';

import '../widgets/enemy_details.dart';

class ChooseEnemy extends StatefulWidget {

 bool fromCombiner = true;

  ChooseEnemy( this.fromCombiner, {super.key});

  @override
  State<ChooseEnemy> createState() => _ChooseEnemyState(fromCombiner);
}

class _ChooseEnemyState extends State<ChooseEnemy> {
  final bool fromCombiner;

  EnemyService enemyService = EnemyService();

  int? selectedIndex;
  Enemy? currentEnemy;

  _ChooseEnemyState(this.fromCombiner);

  late Future<List<Enemy>> futureData;

  void updateEnemy(Enemy instance, int index) async {

    if(fromCombiner){
      Navigator.pop(context, {
        'enemy': instance,
      });
    }else {
      if (instance != currentEnemy) {
        currentEnemy = instance;
        selectedIndex = index;
      } else {
        currentEnemy = null;
        selectedIndex = null;
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    futureData = enemyService.getEnemies();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(title: "Select Enemy", widget: itemInList(context));
  }

  Widget itemInList(BuildContext context) {
    return FutureEnemyList(
        futureData: futureData,
        onEnemyClicked: updateEnemy,
        shrinkWrapping: true,
        searchQuery: "",
        selectedIndex: selectedIndex);
  }

  Widget itemUnderList(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: [
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.3),
              child: FutureEnemyList(
                  futureData: futureData,
                  onEnemyClicked: updateEnemy,
                  shrinkWrapping: true,
                  searchQuery: "",
                  selectedIndex: null)),
          const DefaultDivider(),
          Container(
              // constraints: const BoxConstraints(minWidth: 300, maxWidth: 300),
              child: currentEnemy != null
                  ? EnemyDetails(enemy: currentEnemy!)
                  : Container()),
          Container(
            height: 10,
          )
        ].withSpaceBetween(height: 5));
  }
}
