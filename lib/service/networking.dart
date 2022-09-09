import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

class Networking {
  static const serverAddress = "http://10.0.2.2:8080/";

  Future<Response?> getDataById(endpoint, id) async {
    Uri uri = Uri.parse("$serverAddress/$endpoint/$id");
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      print("An error has occured when reaching $uri");
      print(e);
      return null;
    }
  }

  Future<List<dynamic>> getData(endpoint) async {
    Uri uri = Uri.parse("$serverAddress/$endpoint");
    try {
      // make the request

      Response response = await get(uri);
      List jsonResponse = json.decode(response.body);
      return jsonResponse;
    } catch (e) {
      print("An error has occured when reaching $uri");
      print(e);
      return [];
    }
  }
}
