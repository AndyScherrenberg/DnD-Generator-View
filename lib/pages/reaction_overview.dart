import 'package:dndshower/lists/future_action_list.dart';
import 'package:dndshower/model/action.dart' as dnd_action;
import 'package:dndshower/service/action_service.dart';
import 'package:dndshower/widgets/main_container.dart';
import 'package:flutter/material.dart';

class ReactionOverview extends StatefulWidget {
  @override
  _ReactionOverview createState() => _ReactionOverview();
}

class _ReactionOverview extends State<ReactionOverview> {
  ActionService actionService = ActionService();

  late Future<List<dnd_action.Action>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = actionService.getReactions();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(title: "Reaction overview", widget: Column(children: [
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.6),
              child: FutureActionList(
                futureData: futureData,
                shrinkWrapping: true,
                onActionClicked: () => {},
              )),
        ]));
  }
}
