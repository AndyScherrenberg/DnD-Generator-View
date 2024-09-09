import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/enemy.dart';
import '../widgets/enemy_list_widget.dart';

class FutureEnemyList extends StatelessWidget {
  final Function onEnemyClicked;
  final Future<List<Enemy>> futureData;

  final String searchQuery;

  final bool shrinkWrapping;
  final int? selectedIndex;

  const FutureEnemyList(
      {super.key,
      required this.futureData,
      required this.onEnemyClicked,
      this.shrinkWrapping = false,
      required this.searchQuery,
      this.selectedIndex});

  List<Enemy> resultList(List<Enemy>? data) {
    if (data == null) {
      return List.empty();
    }

    List<Enemy> results = List.empty(growable: true);

    if (searchQuery.isNotEmpty) {
      for (Enemy enemy in data) {
        if (enemy.name.toLowerCase().contains(searchQuery)) {
          results.add(enemy);
        }
      }
    } else {
      results = data;
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Enemy>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Enemy> results = resultList(snapshot.data);

            return ListView.builder(
                shrinkWrap: shrinkWrapping,
                itemCount: results.length,
                itemBuilder: (BuildContext context, int index) {
                  return EnemyListItem(
                    enemy: results[index],
                    index: index,
                    onClick: () => onEnemyClicked(results[index], index),
                    isSelected: (selectedIndex != null &&
                            results[index] == results[selectedIndex!])
                        ? true
                        : false,
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default show a loading spinner.
          return const CircularProgressIndicator();
        });
  }
}
