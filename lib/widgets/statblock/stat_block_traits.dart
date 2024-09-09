import 'package:dndshower/model/trait.dart';
import 'package:dndshower/widgets/default/spacer.dart';
import 'package:flutter/material.dart';

import 'package:dndshower/model/action.dart' as enemyAction;

import '../../theme.dart';
import '../default/default_divider.dart';
import '../trait_list_item.dart';

class StatBlockTraits extends StatelessWidget {
  final String title;
  final List<Trait>? traits;

  const StatBlockTraits({super.key, required this.title, this.traits});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buildAction(context, traits).withSpaceBetween(height: 10),
    );
  }

  List<Widget> buildAction(BuildContext context, List<Trait>? traits) {
    var widgets = <Widget>[];

    if (traits == null || traits.isEmpty) {
      return widgets;
    }
    widgets.add(Text(title,
        style: statBookTextStyle(Theme.of(context).textTheme).headlineLarge));
    for (Trait trait in traits) {
      widgets.add(TraitListItem(trait: trait));
    }

    widgets.add(DefaultDivider());
    return widgets;
  }
}
