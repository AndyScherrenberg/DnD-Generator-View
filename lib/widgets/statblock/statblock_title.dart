import 'package:dndshower/theme.dart';
import 'package:flutter/material.dart';

class StatBlockTitle extends StatelessWidget {
  final String? name;
  final String? type;
  final String? size;
  final String? alignment;

  const StatBlockTitle(
      {super.key, this.name, this.type, this.alignment, this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$name",
            textAlign: TextAlign.start,
            style: statBookTextStyle(Theme.of(context).textTheme).titleMedium),
        Text("$size $type, $alignment",
            textAlign: TextAlign.start,
            style: statBookTextStyle(Theme.of(context).textTheme)
                .labelMedium
                ?.copyWith(fontStyle: FontStyle.italic))
      ],
    );
  }
}
