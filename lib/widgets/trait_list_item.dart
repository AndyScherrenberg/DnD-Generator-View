import 'package:flutter/cupertino.dart';

import '../model/trait.dart';
import '../theme.dart';

class TraitListItem extends StatelessWidget {
  final Trait trait;

  const TraitListItem({super.key, required this.trait});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        child: RichText(
            text: TextSpan(
                style: customLightTheme().textTheme.bodyText1,
                children: <TextSpan>[
              TextSpan(
                  text: '${trait.name}.',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      ' ${trait.description?.replaceAll("{0}", "<Creature>") ?? "##"}')
            ])));
  }
}
