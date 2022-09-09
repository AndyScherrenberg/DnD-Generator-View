import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/race.dart';
import '../widgets/race_list_widget.dart';

class FutureRaceList extends StatelessWidget {
  final Function onRaceClicked;
  final Future<List<Race>> futureData;

  final bool shrinkWrapping;
  final String searchQuery;

  const FutureRaceList(
      {super.key,
      required this.futureData,
      required this.onRaceClicked,
      this.shrinkWrapping = false,
      required this.searchQuery});

  List<Race> resultList(List<Race>? data) {
    if (data == null) {
      return List.empty();
    }

    List<Race> results = List.empty(growable: true);

    if (searchQuery.isNotEmpty) {
      for (Race race in data) {
        if (race.name.toLowerCase().contains(searchQuery)) {
          results.add(race);
        }
      }
    } else {
      results = data;
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Race>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Race> data = resultList(snapshot.data);
            return ListView.builder(
                shrinkWrap: shrinkWrapping,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return RaceListItem(
                      race: data[index],
                      onClick: () => onRaceClicked(data[index]));
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default show a loading spinner.
          return const CircularProgressIndicator();
        });
  }
}
