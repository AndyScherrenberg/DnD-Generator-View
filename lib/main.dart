import 'package:dndshower/pages/action_overview.dart';
import 'package:dndshower/pages/combiner/combiner.dart';
import 'package:dndshower/pages/home.dart';
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


          '/combine': (context) => Combiner(),
          '/actions': (context) => ActionOverview("", true),
          '/reactions': (context) => ActionOverview("", false),
          '/traits': (context) => TraitOverview(""),


        }));
