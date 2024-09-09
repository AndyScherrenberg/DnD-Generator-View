import 'dart:convert';

import 'package:dndshower/model/action.dart';
import 'package:dndshower/service/uri_const.dart';
import 'package:http/http.dart';

class ActionService {
  String uri = "${UriConst.uri}actions";
  String reactionUri = "${UriConst.uri}reactions";

  Future<List<Action>> getActions() async {
    try {

      var responseUrl = Uri.http(
        UriConst.uri,
        "actions",
      );
      // make the request

      Response response = await get(responseUrl);
      print(response.toString());
      List jsonResponse = json.decode(response.body);
      //  print(jsonResponse.toString());
      return jsonResponse.map((data) => Action.fromJson(data)).toList();
      //
      //  return List.empty();
    } catch (e) {
      print("Actions service failed getting actions: $e");
    }

    return [];
  }

  Future<List<Action>> getReactions() async {
    try {
      // make the request
      var responseUrl = Uri.http(
        UriConst.uri,
        "reactions",
      );
      Response response = await get(responseUrl);
      print(response.body.toString());
      List jsonResponse = json.decode(response.body);
      //  print(jsonResponse.toString());
      return jsonResponse.map((data) => Action.fromJson(data)).toList();
      //
      //  return List.empty();
    } catch (e) {
      print("Actions service failed getting reaction: $e");
    }

    return [];
  }
}
