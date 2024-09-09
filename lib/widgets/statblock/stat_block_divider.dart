import 'package:flutter/material.dart';

import '../../theme.dart';

class StatDivider extends Divider {
  const StatDivider({super.key});

  @override
  // TODO: implement height
  double? get height => 1;
  @override
  // TODO: implement color
  Color? get color => ColorData.statBlockRedText;
}
