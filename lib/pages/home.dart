import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void onEnemyButton() {
    Navigator.pushNamed(context, '/enemy');
  }

  void onRaceButton() {
    Navigator.pushNamed(context, '/race');
  }

  void onRaceTypeButton() {
    Navigator.pushNamed(context, '/racetype');
  }

  void onCombiner() {
    Navigator.pushNamed(context, '/combine');
  }

  void onTraits() {
    Navigator.pushNamed(context, '/traits');
  }

  void onActions() {
    Navigator.pushNamed(context, '/actions');
  }

  void onReactions() {
    Navigator.pushNamed(context, '/reactions');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('D&D'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                  ],
                ))));
  }
}
