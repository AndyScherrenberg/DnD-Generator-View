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

  //Update Styling

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

                  Color color = Colors.transparent;
                  if (action.isSelected) {
                    color = ColorData.statBlockRedBackground;
                  }

                  var assetToLoad = (index.isEven)
                      ? "assets/images/list-item-background-a.png"
                      : "assets/images/list-item-background-b.png";
                  return Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: color,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Column(children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  colorFilter:
                                      ColorFilter.mode(color, BlendMode.color),
                                  image: AssetImage(assetToLoad),
                                  fit: BoxFit.fill)),
                          child: ListTile(
                            onTap: () {
                              onActionClicked(action);
                            },
                            title: CalculatedActionListItem(
                                calculatedAction: action),
                          ),
                        ),
                      ]));
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default show a loading spinner.
          return const CircularProgressIndicator();
        });
  }
}
