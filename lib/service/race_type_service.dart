import 'dart:convert';

import 'package:dndshower/model/race_type.dart';
import 'package:dndshower/service/uri_const.dart';
import 'package:http/http.dart';

class RaceTypeService {
  String uri = "${UriConst.uri}racetypes";

  Future<RaceType?> getRaceType(int id) async {
    try {
      // make the request
      var responseUrl = Uri.http(
        UriConst.uri,
        "racetypes/$id",
      );
      Response response = await get(responseUrl);
      RaceType instance = RaceType.fromJson(jsonDecode(response.body));

      instance.isHumanoid = (instance.name == "Humanoid");
      return instance;
    } catch (e) {
      print("ERROR HAS BEEN FOUND");

      print(e);
    }
    return null;
  }

  Future<List<RaceType>> getRaceTypes() async {
    try {
      // make the request
      var responseUrl = Uri.http(
        UriConst.uri,
        "racetypes",
      );
      Response response = await get(responseUrl);
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => RaceType.fromJson(data)).toList();
    } catch (e) {
      print("ERROR HAS BEEN FOUND");
      print(e);
    }
    return [];
  }
}
