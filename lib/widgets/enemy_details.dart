import 'package:dndshower/model/collected_stats.dart';
import 'package:dndshower/model/stat.dart';
import 'package:dndshower/widgets/default/default_divider.dart';
import 'package:dndshower/widgets/default/spacer.dart';
import 'package:dndshower/widgets/statblock/stat_block_actions.dart';
import 'package:dndshower/widgets/statblock/stat_block_traits.dart';
import 'package:dndshower/widgets/statblock/statblock_base_info.dart';
import 'package:dndshower/widgets/statblock/statblock_title.dart';
import 'package:dndshower/widgets/statblock/stats_modifiers.dart';
import 'package:dndshower/widgets/statblock/stats_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/enemy.dart';
import '../theme.dart';

class EnemyDetails extends StatelessWidget {
  final Enemy enemy;

  const EnemyDetails({super.key, required this.enemy});

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
                        name: enemy.name, alignment: enemy.alignment,
                      type: enemy.raceType.name, size: enemy.size.size,
                    ),
                    statBlockBigLineSeperator(),
                    StatBlockBaseInfo(
                        ac: enemy.ac,
                        hitPoints: enemy.defaultHitPoints,
                        hitDice: enemy.hitDice,
                        speed: enemy.speed),
                    statBlockBigLineSeperator(),
                    StatsWidget(collectedStats: enemy.baseStats),
                    statBlockBigLineSeperator(),
                    StatsModifiers(
                        languages: enemy.languages,
                        challengeRating: enemy.challengeRating,
                        proficiencyBonus: enemy.proficiencyBonus,
                      calculatedStats: enemy.calculatedSavingThrows,
                    ),
                    statBlockBigLineSeperator(),
                    StatBlockActions(title: "Actions",actions:  enemy.calculatedActions),

                    StatBlockActions(title: "Reactions",actions:  enemy.calculatedReactions),
                    StatBlockActions(title: "Bonus Actions"),
                    StatBlockTraits(title: "Traits",traits:  enemy.readableTraits),
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
