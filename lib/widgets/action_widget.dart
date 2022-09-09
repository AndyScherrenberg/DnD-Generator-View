import 'package:dndshower/model/action.dart' as dnd_action;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action_list_item.dart';
import 'default/default_divider.dart';

class ActionWidget extends StatelessWidget {
  final List<dnd_action.Action> calculatedActions;

  final String title;

  const ActionWidget(
      {super.key, required this.title, required this.calculatedActions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        const DefaultDivider(),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: calculatedActions.length,
            itemBuilder: (BuildContext context, int index) {
              return CalculatedActionListItem(
                  calculatedAction: calculatedActions[index]);
            }),
      ],
    );
  }
}
