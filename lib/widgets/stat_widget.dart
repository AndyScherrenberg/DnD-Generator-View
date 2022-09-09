import 'package:dndshower/model/stat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatWidget extends StatelessWidget {
  final String name;
  final Stat stat;

  const StatWidget({super.key, required this.name, required this.stat});

  @override
  Widget build(BuildContext context) {
    var modifiedData = "";
    if (stat.modifier < 0) {
      modifiedData = "- ${stat.modifier}";
    } else {
      modifiedData = "+ ${stat.modifier}";
    }

    return Column(
      children: [
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text("${stat.baseStat} ($modifiedData)")
      ],
    );
  }
}
