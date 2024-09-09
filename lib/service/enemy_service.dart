import 'dart:convert';

import 'package:dndshower/model/enemy.dart';
import 'package:dndshower/service/uri_const.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class EnemyService {
  Future<Enemy?> getEnemy(int id) async {
    try {
      var responseUrl = Uri.http(
        UriConst.uri,
        "enemies/$id",
      );
      Response response = await get(responseUrl);
      Enemy instance = Enemy.fromJson(jsonDecode(response.body));
      return instance;
    } catch (e) {
      if (kDebugMode) {
        print("An Error has occured with the enemy data: $e");
      }
    }
    return null;
  }

  Future<List<Enemy>> getEnemies() async {
    try {
      var responseUrl = Uri.http(UriConst.uri, "enemies");
      Response response = await get(responseUrl);
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Enemy.fromJson(data)).toList();
    } catch (e) {
      if (kDebugMode) {
        print("An Error has occured with the enemy list data: $e");
      }
    }

    return [];
  }
}
