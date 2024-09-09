import 'package:dndshower/model/action.dart' as dnd_action;
import 'package:dndshower/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatedActionListItem extends StatelessWidget {
  final dnd_action.Action calculatedAction;

  const CalculatedActionListItem({super.key, required this.calculatedAction});

  @override
  Widget build(BuildContext context) {
    Padding widget;

    if (calculatedAction.weaponAttack) {
      widget = Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        child: RichText(
            text: TextSpan(
          style: customLightTheme().textTheme.bodyMedium,
          children: <TextSpan>[
            TextSpan(
                text: '${calculatedAction.name}.',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: ' ${calculatedAction.actionType.name}:',
                style: const TextStyle(fontStyle: FontStyle.italic)),
            TextSpan(text: ' +${calculatedAction.toHit ?? "##"} to hit, '),
            TextSpan(
                text:
                    " reach/range ${calculatedAction.reach}., ${calculatedAction.target} target(s). "),
            const TextSpan(
                text: 'Hit: ', style: TextStyle(fontStyle: FontStyle.italic)),
            TextSpan(
                text:
                    " ${calculatedAction.hitDice} + ${calculatedAction.hitBonus ?? "##"} ${calculatedAction.damageType?.name} damage."),
          ],
        )),
      );
    } else {
      widget = Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
          child: RichText(
              text: TextSpan(
                  style: customLightTheme().textTheme.bodyMedium,
                  children: <TextSpan>[
                TextSpan(
                    text: '${calculatedAction.name}.',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        ' ${calculatedAction.specialInformation?.replaceAll("{0}", "<Enemy>")}')
              ])));
    }
    return widget;
  }
}
