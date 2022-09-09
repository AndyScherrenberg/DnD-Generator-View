import 'package:dndshower/lists/future_race_list.dart';
import 'package:dndshower/model/race.dart';
import 'package:dndshower/service/race_service.dart';
import 'package:flutter/material.dart';

class SelectRace extends StatefulWidget {
  @override
  _SelectRaceState createState() => _SelectRaceState();
}

class _SelectRaceState extends State<SelectRace> {
  TextEditingController editingController = TextEditingController();

  RaceService raceService = RaceService();

  late Future<List<Race>> futureData;

  String searchQuery = "";

  void filterSearchResults(String query) {
    searchQuery = query;
    setState(() {});
  }

  void updateRace(instance) async {
    Navigator.pop(context, {
      'race': instance,
    });
  }

  @override
  void initState() {
    super.initState();
    futureData = raceService.getEnemies();
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
              child: FutureRaceList(
                  futureData: futureData,
                  onRaceClicked: updateRace,
                  searchQuery: searchQuery))
        ]));
  }
}
