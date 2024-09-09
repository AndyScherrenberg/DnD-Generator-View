import 'package:dndshower/extension/string_extension.dart';
import 'package:dndshower/model/challenge_rating.dart';
import 'package:dndshower/widgets/default/default_divider.dart';
import 'package:dndshower/widgets/default/spacer.dart';
import 'package:dndshower/widgets/statblock/stat_block_actions.dart';
import 'package:dndshower/widgets/statblock/stat_block_traits.dart';
import 'package:dndshower/widgets/statblock/statblock_base_info.dart';
import 'package:dndshower/widgets/statblock/statblock_title.dart';
import 'package:dndshower/widgets/statblock/stats_modifiers.dart';
import 'package:dndshower/widgets/stats_widget.dart';
import 'package:dndshower/widgets/title_widget.dart';
import 'package:dndshower/widgets/trait_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/combine.dart';
import '../theme.dart';
import 'action_widget.dart';

class CombineDetails extends StatelessWidget {
  final Combine combine;

  const CombineDetails({super.key, required this.combine});


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Header
          statBlockBookHeader(),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/paper-texture.png"),
                    repeat: ImageRepeat.repeat)),
            child: Stack(children: [
              statBlockHeader(),
              Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StatBlockTitle(
                          name: combine.name, alignment: combine.alignment,
                          type: combine.raceType, size: combine.size.size,
                        ),
                        statBlockBigLineSeperator(),
                        StatBlockBaseInfo(
                            ac: combine.armorClass,
                            hitPoints: combine.defaultHitPoints,
                            hitDice: combine.hitDice,
                            speed: combine.speed),
                        statBlockBigLineSeperator(),
                        StatsWidget(collectedStats: combine.combinedStats),
                        statBlockBigLineSeperator(),
                        StatsModifiers(
                          languages: combine.languages,
                          challengeRating: combine.challengeRating,
                          proficiencyBonus: combine.proficiencyBonus,
                          calculatedStats: combine.calculatedSavingThrows
                        ),
                        statBlockBigLineSeperator(),
                        StatBlockActions(title: "Actions",actions:  combine.actions),
                        StatBlockActions(title: "Reactions",actions:  combine.reactions),
                        StatBlockActions(title: "Bonus Actions"),
                        StatBlockTraits(title: "Traits",traits:  combine.traits),
                        //Legendary Actions
                      ].withSpaceBetween(height: 10)))
            ]),
          ),
          statBlockBookHeader()
        ]));
  }

  Image statBlockBookHeader() {
    return const Image(
        image: AssetImage("assets/images/stat-bar-book.png"),
        repeat: ImageRepeat.repeat);
  }

  SvgPicture statBlockBigLineSeperator() {
    return SvgPicture.asset(
      "assets/images/stat-block-header-bar.svg",
      height: 10,
      colorFilter:
      ColorFilter.mode(ColorData.statBlockRedText, BlendMode.srcIn),
    );
  }

  Image statBlockHeader() {
    return const Image(
        image: AssetImage("assets/images/stat-block-top-texture.png"),
        repeat: ImageRepeat.repeat);
  }
}
