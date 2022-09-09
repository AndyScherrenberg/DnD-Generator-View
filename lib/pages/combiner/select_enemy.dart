import 'package:dndshower/lists/future_enemy_list.dart';
import 'package:dndshower/model/enemy.dart';
import 'package:dndshower/service/enemy_service.dart';
import 'package:flutter/material.dart';

class SelectEnemy extends StatefulWidget {
  @override
  _SelectEnemyState createState() => _SelectEnemyState();
}

class _SelectEnemyState extends State<SelectEnemy> {
  TextEditingController editingController = TextEditingController();

  EnemyService enemyService = EnemyService();

  late Future<List<Enemy>> futureData;
  late List<Enemy> endData;
  List<Enemy> items = List.empty(growable: true);

  String searchQuery = "";

  void filterSearchResults(String query) {
    searchQuery = query;
    setState(() {});
  }

  void updateEnemy(Enemy instance) async {
    Navigator.pop(context, {
      'enemy': instance,
    });
  }

  @override
  void initState() {
    super.initState();
    futureData = enemyService.getEnemies().then((value) => endData = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pick an Enemy'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: editingController,
              decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
              child: FutureEnemyList(
            futureData: futureData,
            onEnemyClicked: updateEnemy,
            shrinkWrapping: false,
            searchQuery: searchQuery,
          ))
        ]));
  }
}
