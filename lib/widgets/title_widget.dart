import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String value;

  const TitleWidget({super.key, required this.title, required this.value});

  final TextStyle boldStyle = const TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: customLightTheme().textTheme.bodyMedium,
            children: <TextSpan>[
          TextSpan(text: title, style: boldStyle),
          TextSpan(text: ' $value'),
        ]));
  }
}
