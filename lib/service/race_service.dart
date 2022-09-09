import 'dart:convert';

import 'package:dndshower/service/uri_const.dart';
import 'package:http/http.dart';

import '../model/race.dart';

class RaceService {
  String uri = "${UriConst.uri}races";

  Future<Race?> getEnemy(int id) async {
    try {
      // make the request
      Uri ur = Uri.parse("$uri/$id");
      Response response = await get(ur);
      Race instance = Race.fromJson(jsonDecode(response.body));
      return instance;
    } catch (e) {
      print("ERROR HAS BEEN FOUND");

      print(e);
    }
    return null;
  }

  Future<List<Race>> getEnemies() async {
    try {
      // make the request
      Uri ur = Uri.parse(uri);
      Response response = await get(ur);
      print(response.toString());
      List jsonResponse = json.decode(response.body);
      //  print(jsonResponse.toString());
      return jsonResponse.map((data) => Race.fromJson(data)).toList();
      //
      //  return List.empty();
    } catch (e) {
      print("ERROR HAS BEEN FOUND");

      print(e);
    }

    return [];
  }
}
