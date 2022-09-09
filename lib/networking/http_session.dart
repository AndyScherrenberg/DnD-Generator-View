import 'dart:convert';

import 'package:http/http.dart';

import './http_request.dart';
import './network_mappers.dart';
import './post/post_errorResponse.dart';

/// 'HttpSessionProtocol' acts as provider to send requests to the Network.
abstract class HttpSessionProtocol<T> {
  Future<Mapable> request({HttpRequestProtocol service, Mapable responseType});
}

class HttpSession implements HttpSessionProtocol {
  final Client _client;

  HttpSession(this._client);

  @override
  Future<Mapable> request(
      {HttpRequestProtocol? service, Mapable? responseType}) async {
    final request = HttpRequest(service!);

    final requestResponse = await _client.send(request);

    if (requestResponse.statusCode >= 200 &&
        requestResponse.statusCode <= 299) {
      final data = await requestResponse.stream.transform(utf8.decoder).join();
      return Mapable(responseType!, data);
    } else {
      final Map<String, dynamic> responseError = {
        "error_code": "${requestResponse.statusCode}",
        "description": "Error retrieving data from the Server."
      };

      return ErrorResponse().fromJson(responseError);
    }
  }
}
