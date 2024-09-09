import 'package:dndshower/widgets/action_list_item.dart';
import 'package:dndshower/widgets/default/spacer.dart';
import 'package:flutter/material.dart';

import 'package:dndshower/model/action.dart' as dnd_action;

import '../../theme.dart';
import '../default/default_divider.dart';

class StatBlockActions extends StatelessWidget {
  final String title;
  final List<dnd_action.Action>? actions;

  const StatBlockActions({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buildAction(context, actions).withSpaceBetween(height: 10),
    );
  }

  List<Widget> buildAction(
      BuildContext context, List<dnd_action.Action>? actions) {
    var widgets = <Widget>[];

    if (actions == null || actions.isEmpty) {
      return widgets;
    }
    widgets.add(Text(title,
        style: statBookTextStyle(Theme.of(context).textTheme).headlineLarge));
    for (dnd_action.Action action in actions) {
      widgets.add(CalculatedActionListItem(calculatedAction: action));
    }

    widgets.add(DefaultDivider());

    return widgets;
  }
}
