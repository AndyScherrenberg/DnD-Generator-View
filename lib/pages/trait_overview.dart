import 'package:dndshower/lists/future_trait_list.dart';
import 'package:dndshower/service/trait_service.dart';
import 'package:flutter/material.dart';

import '../model/trait.dart';

class TraitOverview extends StatefulWidget {
  String data;

  TraitOverview(this.data, {super.key});

  @override
  State<StatefulWidget> createState() => _TraitOverview(data);
}

class _TraitOverview extends State<TraitOverview> {
  TextEditingController editingController = TextEditingController();

  String preFilled;

  late List<int> traitIds = List.empty(growable: true);

  _TraitOverview(this.preFilled) {
    if (preFilled.isNotEmpty) {
      traitIds.addAll(preFilled.split(",").map((e) => int.parse(e)));
    }
  }

  TraitService traitService = TraitService();

  late Future<List<Trait>> futureData;

  String searchQuery = "";

  void filterSearchResults(String query) {
    searchQuery = query;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    futureData = traitService.getTraits();
  }

  void onTraitClicked(Trait instance) {
    instance.isSelected = !instance.isSelected;
    if (instance.isSelected) {
      traitIds.add(instance.id ?? 0);
    } else {
      traitIds.remove(instance.id ?? 0);
    }
    setState(() {});
  }

  void onCloseScreen() async {
    Navigator.pop(context, {
      'traits': traitIds.join(","),
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Trait overview'),
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
                  child: FutureTraitList(
                      futureData: futureData,
                      shrinkWrapping: true,
                      onTraitClicked: onTraitClicked,
                      preFilled: traitIds,
                      searchQuery: searchQuery)),
            ])));
  }
}
