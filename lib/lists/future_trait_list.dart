import 'package:dndshower/widgets/trait_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/trait.dart';
import '../theme.dart';

class FutureTraitList extends StatelessWidget {
  final Future<List<Trait>> futureData;
  final Function onTraitClicked;
  final bool shrinkWrapping;

  final List<int>? preFilled;

  final String searchQuery;

  const FutureTraitList(
      {super.key,
      required this.futureData,
      required this.onTraitClicked,
      this.shrinkWrapping = false,
      this.preFilled,
      this.searchQuery = ""});

  List<Trait> resultList(List<Trait>? data) {
    if (data == null) {
      return List.empty();
    }

    List<Trait> results = List.empty(growable: true);

    if (searchQuery.isNotEmpty) {
      for (Trait trait in data) {
        if (trait.name?.toLowerCase().contains(searchQuery.toLowerCase()) ==
                true ||
            trait.description
                    ?.toLowerCase()
                    .contains(searchQuery.toLowerCase()) ==
                true) {
          results.add(trait);
        }
      }
    } else {
      results = data;
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Trait>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Trait> data = resultList(snapshot.data);
            return ListView.builder(
                shrinkWrap: shrinkWrapping,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  Trait trait = data[index];

                  if (preFilled?.contains(trait.id) == true) {
                    trait.isSelected = true;
                  }

                  Color color = ColorData.mediumYellow;
                  if (trait.isSelected) {
                    color = Colors.red;
                  }

                  return Card(
                      color: color,
                      child: ListTile(
                          onTap: () => onTraitClicked(trait),
                          title: TraitListItem(trait: trait)));
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default show a loading spinner.
          return const CircularProgressIndicator();
        });
  }
}
