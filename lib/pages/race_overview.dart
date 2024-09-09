import 'package:dndshower/lists/future_race_list.dart';
import 'package:dndshower/model/race.dart';
import 'package:dndshower/service/race_service.dart';
import 'package:flutter/material.dart';

import '../widgets/main_container.dart';
import '../widgets/race_details.dart';

class ChooseRace extends StatefulWidget {
  final bool fromCombiner;

  ChooseRace( this.fromCombiner, {super.key});

  @override
  _ChooseRaceState createState() => _ChooseRaceState(fromCombiner);
}

class _ChooseRaceState extends State<ChooseRace> {

  final bool fromCombiner;

  RaceService raceService = RaceService();

  Race? currentRace;

  late Future<List<Race>> futureData;
  late List<Race> endData;

  _ChooseRaceState(this.fromCombiner);

  void updateRace(index) async {

    if(fromCombiner){
      Navigator.pop(context, {
        'race': index,
      });
    }else {
      currentRace = index;
      setState(() {});
    }

  }

  @override
  void initState() {
    super.initState();
    futureData = raceService.getEnemies().then((value) => endData = value);
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        title: "Pick Race",
        widget: Column(children: [
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
