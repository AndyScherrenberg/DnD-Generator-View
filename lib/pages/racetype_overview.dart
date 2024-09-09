import 'package:dndshower/service/race_type_service.dart';
import 'package:flutter/material.dart';

import '../model/race_type.dart';
import '../widgets/main_container.dart';
import '../widgets/racetype_list_widget.dart';

class ChooseRaceType extends StatefulWidget {
  @override
  _ChooseRaceTypeState createState() => _ChooseRaceTypeState();
}

class _ChooseRaceTypeState extends State<ChooseRaceType> {
  RaceTypeService raceTypeService = RaceTypeService();

  late Future<List<RaceType>> futureData;
  late List<RaceType> endData;

  void updateRaceType(index) async {
    await raceTypeService.getRaceType(endData[index].id).then((value) => {
          Navigator.pop(context, {
            'name': value?.name,
            'isHumanoid': value?.isHumanoid,
          })
        });
  }

  @override
  void initState() {
    super.initState();
    futureData = raceTypeService.getRaceTypes();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        title: "Pick Race Type",
        widget: Center(
            child: FutureBuilder<List<RaceType>>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<RaceType> data =
                        snapshot.data != null ? snapshot.data! : List.empty();
                    endData = data;
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RaceTypeListItem(
                              raceType: data[index],
                              onClick: () => updateRaceType(index));
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default show a loading spinner.
                  return const CircularProgressIndicator();
                })));
  }
}
