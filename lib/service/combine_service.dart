import 'dart:convert';

import 'package:dndshower/service/uri_const.dart';
import 'package:http/http.dart';

import '../model/combine.dart';

class CombineService {
  String uri = "${UriConst.uri}combine";

  Future<Combine?> getCombinedResult(int enemyId, int raceId) async {
    try {
      // make the request
      Uri ur = Uri.parse("$uri/$enemyId/$raceId");
      Response response = await get(ur);
      print(response.body);
      Combine instance = Combine.fromJson(jsonDecode(response.body));

      return instance;
    } catch (e) {
      print("Combine service failed: $e");
    }
    return null;
  }

  Future<Combine?> getCombinedResultWithExtra(
      int enemyId,
      int raceId,
      String? traits,
      String? actions,
      String? reactions,
      bool withoutDefaultActions,
      bool withoutDefaultReactions,
      bool withoutDefaultTraits) async {
    try {
      // make the request
      String url = "$uri/$enemyId/$raceId";
      String searcher = "";

      if (traits?.isNotEmpty == true) {
        searcher = "/extra?traits=$traits";
      }

      if (actions?.isNotEmpty == true) {
        if (searcher.isEmpty) {
          searcher = "/extra?";
        } else {
          searcher += "&";
        }
        searcher += "actions=$actions";
      }

      if (reactions?.isNotEmpty == true) {
        if (searcher.isEmpty) {
          searcher = "/extra?";
        } else {
          searcher += "&";
        }
        searcher += "reactions=$reactions";
      }

      if (withoutDefaultActions) {
        if (searcher.isEmpty) {
          searcher = "/extra?";
        } else {
          searcher += "&";
        }
        searcher += "noDefaultActions=true";
      }

      if (withoutDefaultReactions) {
        if (searcher.isEmpty) {
          searcher = "/extra?";
        } else {
          searcher += "&";
        }
        searcher += "noDefaultReactions=true";
      }

      if (withoutDefaultTraits) {
        if (searcher.isEmpty) {
          searcher = "/extra?";
        } else {
          searcher += "&";
        }
        searcher += "noDefaultTraits=true";
      }

      Uri ur = Uri.parse("$url$searcher");

      print(ur);

      Response response = await get(ur);
      print(response.body);
      Combine instance = Combine.fromJson(jsonDecode(response.body));

      return instance;
    } catch (e) {
      print("Combine service failed: $e");
    }
    return null;
  }
}
