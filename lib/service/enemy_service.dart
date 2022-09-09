import 'dart:convert';

import 'package:dndshower/model/enemy.dart';
import 'package:dndshower/service/uri_const.dart';
import 'package:http/http.dart';

import 'networking.dart';

class EnemyService {
  String uri = "${UriConst.uri}enemies";
  Networking networking = Networking();

  Future<Enemy?> getEnemy(int id) async {
    try {
      // make the request

      Uri ur = Uri.parse("$uri/$id");
      Response response = await get(ur);
      Enemy instance = Enemy.fromJson(jsonDecode(response.body));
      return instance;
    } catch (e) {
      print("ERROR HAS BEEN FOUND");

      print(e);
    }
    return null;
  }

  Future<List<Enemy>> getEnemies() async {
    try {
      // make the request
      Uri ur = Uri.parse(uri);
      Response response = await get(ur);
      print(response.toString());
      List jsonResponse = json.decode(response.body);
      //  print(jsonResponse.toString());
      return jsonResponse.map((data) => Enemy.fromJson(data)).toList();
      //
      //  return List.empty();
    } catch (e) {
      print("ERROR HAS BEEN FOUND");

      print(e);
    }

    return [];
  }
}
