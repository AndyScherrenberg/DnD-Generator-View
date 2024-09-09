import 'dart:convert';

import 'package:dndshower/service/uri_const.dart';
import 'package:http/http.dart';

import '../model/race.dart';

class RaceService {
  Future<Race?> getEnemy(int id) async {
    try {
      var responseUrl = Uri.http(
        UriConst.uri,
        "races/$id",
      );
      Response response = await get(responseUrl);

      Race instance = Race.fromJson(jsonDecode(response.body));
      return instance;
    } catch (e) {
      print("An error has occured when parsing the race data: $e");
    }
    return null;
  }

  Future<List<Race>> getEnemies() async {
    try {
      // make the request
      var responseUrl = Uri.http(
        UriConst.uri,
        "races",
      );
      Response response = await get(responseUrl);
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Race.fromJson(data)).toList();
    } catch (e) {
      print("An error has occured when parsing the race list data: $e");
    }

    return [];
  }
}
