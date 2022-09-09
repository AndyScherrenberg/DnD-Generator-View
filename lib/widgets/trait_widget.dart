import 'package:dndshower/widgets/trait_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/trait.dart';
import 'default/default_divider.dart';

class TraitWidget extends StatelessWidget {
  final List<Trait> traits;

  final String title;

  const TraitWidget({super.key, required this.title, required this.traits});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        const DefaultDivider(),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: traits.length,
            itemBuilder: (BuildContext context, int index) {
              return TraitListItem(trait: traits[index]);
            }),
      ],
    );
  }
}
