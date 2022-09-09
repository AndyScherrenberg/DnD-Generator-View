import 'dart:convert';

import 'package:dndshower/service/uri_const.dart';
import 'package:http/http.dart';

import '../model/trait.dart';

class TraitService {
  String uri = "${UriConst.uri}traits";

  Future<List<Trait>> getTraits() async {
    try {
      // make the request
      Uri ur = Uri.parse(uri);
      Response response = await get(ur);
      print(response.toString());
      List jsonResponse = json.decode(response.body);
      //  print(jsonResponse.toString());
      return jsonResponse.map((data) => Trait.fromJson(data)).toList();
      //
      //  return List.empty();
    } catch (e) {
      print("Actions service failed getting actions: $e");
    }

    return [];
  }
}
