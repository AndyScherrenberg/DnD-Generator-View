import 'package:dndshower/model/action.dart' as dnd_action;
import 'package:dndshower/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/action_list_item.dart';

class FutureActionList extends StatelessWidget {
  final Future<List<dnd_action.Action>> futureData;
  final Function onActionClicked;

  final List<int>? preFilled;

  final String searchQuery;

  final bool shrinkWrapping;

  const FutureActionList(
      {super.key,
      required this.futureData,
      required this.onActionClicked,
      this.shrinkWrapping = false,
      this.preFilled,
      this.searchQuery = ""});

  List<dnd_action.Action> resultList(List<dnd_action.Action>? data) {
    if (data == null) {
      return List.empty();
    }

    List<dnd_action.Action> results = List.empty(growable: true);

    if (searchQuery.isNotEmpty) {
      for (dnd_action.Action action in data) {
        if (action.name.toLowerCase().contains(searchQuery.toLowerCase())) {
          results.add(action);
        }
      }
    } else {
      results = data;
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dnd_action.Action>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dnd_action.Action> data = resultList(snapshot.data);

            return ListView.builder(
                shrinkWrap: shrinkWrapping,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  dnd_action.Action action = data[index];

                  if (preFilled?.contains(action.id) == true) {
                    action.isSelected = true;
                  }

                  Color color = ColorData.mediumYellow;
                  if (action.isSelected) {
                    color = Colors.red;
                  }

                  return Card(
                    child: ListTile(
                      onTap: () {
                        onActionClicked(action);
                      },
                      title: CalculatedActionListItem(calculatedAction: action),
                    ),
                    color: color,
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
