import 'package:dndshower/lists/future_action_list.dart';
import 'package:dndshower/model/action.dart' as dnd_action;
import 'package:dndshower/service/action_service.dart';
import 'package:flutter/material.dart';

class ActionOverview extends StatefulWidget {
  String data;
  bool isActions;

  ActionOverview(this.data, this.isActions, {super.key});

  @override
  State<StatefulWidget> createState() => _ActionOverview(data, isActions);
}

class _ActionOverview extends State<ActionOverview> {
  TextEditingController editingController = TextEditingController();

  String preFilled;
  bool isActions;

  late List<int> actionIds = List.empty(growable: true);

  _ActionOverview(this.preFilled, this.isActions) {
    if (preFilled.isNotEmpty) {
      actionIds.addAll(preFilled.split(",").map((e) => int.parse(e)));
    }
  }

  ActionService actionService = ActionService();

  bool dataCollected = false;

  late Future<List<dnd_action.Action>> futureData;

  Future<List<dnd_action.Action>> getFutureData() {
    if (dataCollected) {
      return futureData;
    }

    if (isActions) {
      futureData = actionService.getActions();
    } else {
      futureData = actionService.getReactions();
    }
    dataCollected = true;
    return futureData;
  }

  String searchQuery = "";

  void filterSearchResults(String query) {
    searchQuery = query;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  void onActionClicked(dnd_action.Action instance) {
    instance.isSelected = !instance.isSelected;
    if (instance.isSelected) {
      actionIds.add(instance.id ?? 0);
    } else {
      actionIds.remove(instance.id ?? 0);
    }
    setState(() {});
  }

  void onCloseScreen() async {
    String keyName = "actions";
    if (!isActions) {
      keyName = "reactions";
    }
    Navigator.pop(context, {
      keyName: actionIds.join(","),
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Action overview'),
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => onCloseScreen(),
              ),
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Expanded(
                  child: FutureActionList(
                      futureData: getFutureData(),
                      shrinkWrapping: true,
                      onActionClicked: onActionClicked,
                      preFilled: actionIds,
                      searchQuery: searchQuery)),
            ])));
  }
}
