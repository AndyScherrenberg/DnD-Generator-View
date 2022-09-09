import 'package:dndshower/pages/action_overview.dart';
import 'package:dndshower/pages/combiner/combiner.dart';
import 'package:dndshower/pages/combiner/select_enemy.dart';
import 'package:dndshower/pages/combiner/select_race.dart';
import 'package:dndshower/pages/enemy_overview.dart';
import 'package:dndshower/pages/home.dart';
import 'package:dndshower/pages/race_overview.dart';
import 'package:dndshower/pages/racetype_overview.dart';
import 'package:dndshower/pages/trait_overview.dart';
import 'package:dndshower/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        // darkTheme: customDarkTheme(),
        theme: customLightTheme(),
        // themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/home': (context) => Home(),
          '/racetype': (context) => ChooseRaceType(),
          '/enemy': (context) => ChooseEnemy(),
          '/race': (context) => ChooseRace(),
          '/combine': (context) => Combiner(),
          '/actions': (context) => ActionOverview("", true),
          '/reactions': (context) => ActionOverview("", false),
          '/traits': (context) => TraitOverview(""),
          '/combine/enemy': (context) => SelectEnemy(),
          '/combine/race': (context) => SelectRace(),
        }));
