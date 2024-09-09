import 'package:dndshower/pages/action_overview.dart';
import 'package:dndshower/pages/combiner/combiner.dart';
import 'package:dndshower/pages/enemy_overview.dart';
import 'package:dndshower/pages/race_overview.dart';
import 'package:dndshower/pages/racetype_overview.dart';
import 'package:dndshower/pages/trait_overview.dart';
import 'package:dndshower/widgets/main_container.dart';
import 'package:dndshower/widgets/default/spacer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}

class _HomeState extends State<Home> {
  void pusher(StatefulWidget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => page,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  void onEnemyButton() {
    pusher(ChooseEnemy(false));
  }

  void onRaceButton() {
    pusher(ChooseRace(false));
  }

  void onRaceTypeButton() {
    pusher(ChooseRaceType());
  }

  void onCombiner() {
    pusher(Combiner());
  }

  void onTraits() {


    pusher(TraitOverview(""));
  }

  void onActions() {
    pusher(ActionOverview("", true));
  }

  void onReactions() {
    pusher(ActionOverview("", false));
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        title: 'Dungeon and Dragons stats generator',
        widget: SafeArea(
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: onEnemyButton,
                      child: Text("Enemy"),
                    ),
                    TextButton(
                      onPressed: onRaceButton,
                      child: Text("Race"),
                    ),
                    TextButton(
                      onPressed: onRaceTypeButton,
                      child: Text("RaceType"),
                    ),
                    TextButton(
                      onPressed: onActions,
                      child: Text("Actions"),
                    ),
                    TextButton(
                      onPressed: onReactions,
                      child: Text("Reactions"),
                    ),
                    TextButton(
                      onPressed: onTraits,
                      child: Text("Traits"),
                    ),
                    TextButton(
                      onPressed: onCombiner,
                      child: Text("Combine"),
                    )
                  ].withSpaceBetween(height: 10),
                ))));
  }
}
