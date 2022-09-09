import 'package:dndshower/model/combine.dart';
import 'package:dndshower/model/enemy.dart';
import 'package:dndshower/model/race.dart';
import 'package:dndshower/pages/action_overview.dart';
import 'package:dndshower/pages/trait_overview.dart';
import 'package:dndshower/service/combine_service.dart';
import 'package:dndshower/theme.dart';
import 'package:dndshower/widgets/combine_details.dart';
import 'package:flutter/material.dart';

class Combiner extends StatefulWidget {
  @override
  _CombinerState createState() => _CombinerState();
}

class _CombinerState extends State<Combiner> {
  Enemy? enemy;
  Race? race;
  Combine? combine;

  String? traits;
  String? actions;
  String? reactions;

  bool withoutDefaultActions = false;
  bool withoutDefaultReactions = false;
  bool withoutDefaultTraits = false;

  CombineService combineService = CombineService();

  void onEnemyPressed() async {
    Enemy? currentEnemy = enemy;
    dynamic result = await Navigator.pushNamed(context, '/combine/enemy');
    if (result != null) {
      setState(() {
        enemy = result['enemy'];
        if (currentEnemy?.id != enemy?.id) {
          onCombinePressed();
        }
      });
    }
  }

  void onRacePressed() async {
    Race? currentRace = race;
    dynamic result = await Navigator.pushNamed(context, '/combine/race');
    if (result != null) {
      setState(() {
        race = result['race'];
        if (currentRace?.id != race?.id) {
          onCombinePressed();
        }
      });
    }
  }

  void onActionsPressed() async {
    String? currentActions = actions;

    dynamic result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ActionOverview(actions ?? "", true)));
    if (result != null) {
      actions = result["actions"];
    } else {
      actions = null;
    }
    setState(() {
      if (currentActions != actions) {
        onCombinePressed();
      }
    });
  }

  void onTraitsPressed() async {
    String? currentTraits = traits;
    dynamic result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => TraitOverview(traits ?? "")));
    if (result != null) {
      traits = result["traits"];
    } else {
      traits = null;
    }
    setState(() {
      if (currentTraits != traits) {
        onCombinePressed();
      }
    });
  }

  void onReactionsPressed() async {
    String? currentReactions = reactions;
    dynamic result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ActionOverview(reactions ?? "", false)));
    if (result != null) {
      reactions = result["reactions"];
    } else {
      reactions = null;
    }
    setState(() {
      if (currentReactions != reactions) {
        onCombinePressed();
      }
    });
  }

  Future<void> onCombinePressed() async {
    if (enemy != null && race != null) {
      await combineService
          .getCombinedResultWithExtra(
              enemy?.id ?? 0,
              race?.id ?? 0,
              traits,
              actions,
              reactions,
              withoutDefaultActions,
              withoutDefaultReactions,
              withoutDefaultTraits)
          .then((value) => combine = value);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Combine 2 options'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: onEnemyPressed,
                    style: OutlinedButton.styleFrom(
                        backgroundColor: enemy != null
                            ? Colors.red
                            : ColorData.mediumYellow),
                    child: Text(enemy?.name ?? "Enemy"),
                  ),
                  OutlinedButton(
                    onPressed: onRacePressed,
                    style: OutlinedButton.styleFrom(
                        backgroundColor:
                            race != null ? Colors.red : ColorData.mediumYellow),
                    child: Text(race?.name ?? "Race"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    OutlinedButton(
                      onPressed: onActionsPressed,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: actions?.isNotEmpty == true
                              ? Colors.red
                              : ColorData.mediumYellow),
                      child: Text("Actions"),
                    ),
                    Text("No defaultActions"),
                    Checkbox(
                      onChanged: (value) {
                        withoutDefaultActions = !withoutDefaultActions;
                        setState(() {
                          onCombinePressed();
                        });
                      },
                      value: withoutDefaultActions,
                    )
                  ]),
                  Column(children: [
                    OutlinedButton(
                      onPressed: onReactionsPressed,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: reactions?.isNotEmpty == true
                              ? Colors.red
                              : ColorData.mediumYellow),
                      child: Text("Reactions"),
                    ),
                    Text("No default Reactions"),
                    Checkbox(
                      onChanged: (value) {
                        withoutDefaultReactions = !withoutDefaultReactions;
                        setState(() {
                          onCombinePressed();
                        });
                      },
                      value: withoutDefaultReactions,
                    )
                  ]),
                  Column(children: [
                    OutlinedButton(
                      onPressed: onTraitsPressed,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: traits?.isNotEmpty == true
                              ? Colors.red
                              : ColorData.mediumYellow),
                      child: Text("Traits"),
                    ),
                    Text("No default Traits"),
                    Checkbox(
                      onChanged: (value) {
                        withoutDefaultTraits = !withoutDefaultTraits;
                        setState(() {
                          onCombinePressed();
                        });
                      },
                      value: withoutDefaultTraits,
                    )
                  ])
                ],
              ),
              combine != null ? CombineDetails(combine: combine!) : Container()
            ],
          ),
        ));
  }
}
