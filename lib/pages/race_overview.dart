import 'package:dndshower/lists/future_race_list.dart';
import 'package:dndshower/model/race.dart';
import 'package:dndshower/service/race_service.dart';
import 'package:flutter/material.dart';

import '../widgets/race_details.dart';

class ChooseRace extends StatefulWidget {
  @override
  _ChooseRaceState createState() => _ChooseRaceState();
}

class _ChooseRaceState extends State<ChooseRace> {
  RaceService raceService = RaceService();

  Race? currentRace;

  late Future<List<Race>> futureData;
  late List<Race> endData;

  void updateRace(index) async {
    currentRace = index;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    futureData = raceService.getEnemies().then((value) => endData = value);
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
              child: FutureRaceList(
                futureData: futureData,
                onRaceClicked: updateRace,
                shrinkWrapping: true,
                searchQuery: "",
              )),
          Container(
              child: currentRace != null
                  ? RaceDetails(race: currentRace!)
                  : Container())
        ]));
  }
}
