import 'dart:convert';

import 'package:dndshower/service/uri_const.dart';
import 'package:http/http.dart';

import '../model/combine.dart';

class CombineService {
  Future<Combine?> getCombinedResult(int enemyId, int raceId) async {
    try {
      var responseUrl = Uri.http(UriConst.uri, "/combine/$enemyId/$raceId");
      // make the request
      Response response = await get(responseUrl);
      //  print(response.body);
      Combine instance = Combine.fromJson(jsonDecode(response.body));
      print(response.body);
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

      Map<String, String> queryParams = {};
      var searcher = "";
      if (traits?.isNotEmpty == true) {
        queryParams["traits"] = traits!;
      }

      if (actions?.isNotEmpty == true) {
        queryParams["actions"] = actions!;
      }

      if (reactions?.isNotEmpty == true) {
        queryParams["reactions"] = reactions!;
      }

      if (withoutDefaultActions) {
        queryParams["noDefaultActions"] = "true";
      }

      if (withoutDefaultReactions) {
        queryParams["noDefaultReactions"] = "true";
        searcher += "noDefaultReactions=true";
      }

      if (withoutDefaultTraits) {
        queryParams["noDefaultTraits"] = "true";
      }

      var responseUrl = Uri.http(UriConst.uri, "/combine/$enemyId/$raceId/");
      if (queryParams.isNotEmpty) {
        responseUrl = Uri.http(UriConst.uri, "/combine/$enemyId/$raceId/extra",
             queryParams);
      }

      Response response = await get(responseUrl);
      print(response.body);
      Combine instance = Combine.fromJson(jsonDecode(response.body));

      return instance;
    } catch (e) {
      print("Combine service failed: $e");
    }
    return null;
  }
}
