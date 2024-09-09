import 'package:dndshower/model/combine.dart';
import 'package:dndshower/model/enemy.dart';
import 'package:dndshower/model/race.dart';
import 'package:dndshower/pages/action_overview.dart';
import 'package:dndshower/pages/enemy_overview.dart';
import 'package:dndshower/pages/race_overview.dart';
import 'package:dndshower/pages/trait_overview.dart';
import 'package:dndshower/service/combine_service.dart';
import 'package:dndshower/theme.dart';
import 'package:dndshower/widgets/combine_details.dart';
import 'package:dndshower/widgets/default/spacer.dart';
import 'package:flutter/material.dart';

import '../../widgets/default/default_divider.dart';
import '../../widgets/main_container.dart';

class Combiner extends StatefulWidget {
  @override
  _CombinerState createState() => _CombinerState();
}

class _CombinerState extends State<Combiner> {
  Future<dynamic> pusher(StatefulWidget page) {
    return Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => page,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  Enemy? enemy;
  Race? race;
  Combine? combine;

  String? traits;
  String? actions;
  String? reactions;

  bool withoutDefaultActions = false;
  bool withoutDefaultReactions = false;
  bool withoutDefaultTraits = false;

  bool showExtra = false;

  CombineService combineService = CombineService();

  void onEnemyPressed() async {
    Enemy? currentEnemy = enemy;
    dynamic result = await pusher(ChooseEnemy(true));
    if (result != null) {
      setState(() {
        enemy = result['enemy'];
        if (currentEnemy?.id != enemy?.id) {
          onCombinePressed();
        }
      });
    }
  }

  void onExtraPressed() async {
    showExtra = !showExtra;
    setState(() {});
  }

  void onRacePressed() async {
    Race? currentRace = race;
    dynamic result = await pusher(ChooseRace(true));
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
    dynamic result = await pusher(ActionOverview(actions ?? "", true));
    if (result != null) {
      actions = result["actions"];
    } else {
      actions = null;
    }
    setState(() {});
  }

  void onTraitsPressed() async {
    dynamic result = await pusher(TraitOverview(traits ?? ""));
    if (result != null) {
      traits = result["traits"];
    } else {
      traits = null;
    }
    setState(() {});
  }

  void onReactionsPressed() async {
    dynamic result = await pusher(ActionOverview(reactions ?? "", false));
    if (result != null) {
      reactions = result["reactions"];
    } else {
      reactions = null;
    }
    setState(() {});
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
    return MainContainer(
        title: "Combiner",
        widget: ListView(shrinkWrap: true, children: [
          Container(
            child: Column(
              children: [
                headerButtons(),
                DefaultDivider(),
                createExtraOptionsRow(),
                combine != null
                    ? CombineDetails(combine: combine!)
                    : Container()
              ],
            ),
          )
        ]));
  }

  Row headerButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton(
          onPressed: onEnemyPressed,
          style: OutlinedButton.styleFrom(
              backgroundColor: enemy != null
                  ? ColorData.statBlockRedText
                  : ColorData.mainButtonColorDark),
          child: Text(enemy?.name ?? "Enemy"),
        ),
        OutlinedButton(
          onPressed: onRacePressed,
          style: OutlinedButton.styleFrom(
              backgroundColor: race != null
                  ? ColorData.statBlockRedText
                  : ColorData.mainButtonColorDark),
          child: Text(race?.name ?? "Race"),
        ),
        OutlinedButton(
          onPressed: onExtraPressed,
          style: OutlinedButton.styleFrom(
              backgroundColor: showExtra
                  ? ColorData.statBlockRedText
                  : ColorData.mainButtonColorDark),
          child: Text(showExtra ? "Hide Options" : "Show Options"),
        ),
      ],
    );
  }

  Widget createExtraOptionsRow() {
    if (showExtra) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              OutlinedButton(
                onPressed: onActionsPressed,
                style: OutlinedButton.styleFrom(
                    backgroundColor: actions?.isNotEmpty == true
                        ? ColorData.statBlockRedText
                        : ColorData.mainButtonColorDark),
                child: Text("Actions"),
              ),
              Text("No defaultActions"),
              Checkbox(
                onChanged: (value) {
                  withoutDefaultActions = !withoutDefaultActions;
                  setState(() {});
                },
                value: withoutDefaultActions,
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              OutlinedButton(
                onPressed: onReactionsPressed,
                style: OutlinedButton.styleFrom(
                    backgroundColor: reactions?.isNotEmpty == true
                        ? ColorData.statBlockRedText
                        : ColorData.mainButtonColorDark),
                child: Text("Reactions"),
              ),
              Text("No default Reactions"),
              Checkbox(
                onChanged: (value) {
                  withoutDefaultReactions = !withoutDefaultReactions;
                  setState(() {});
                },
                value: withoutDefaultReactions,
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: onTraitsPressed,
                  style: OutlinedButton.styleFrom(
                      backgroundColor: traits?.isNotEmpty == true
                          ? ColorData.statBlockRedText
                          : ColorData.mainButtonColorDark),
                  child: Text("Traits"),
                ),
                Text("No default Traits"),
                Checkbox(
                  onChanged: (value) {
                    withoutDefaultTraits = !withoutDefaultTraits;
                    setState(() {});
                  },
                  value: withoutDefaultTraits,
                )
              ],
            ),
            DefaultDivider(),
            OutlinedButton(
                onPressed: onCombinePressed,
                style: OutlinedButton.styleFrom(
                    backgroundColor: ColorData.mainButtonColorDark),
                child: Text("Create")),
            DefaultDivider(),
          ].withSpaceBetween(height: 10));
    } else {
      return Container();
    }
  }
}
