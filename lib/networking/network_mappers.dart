import 'dart:convert';

// Handler for the network's request.
abstract class RequestMapable {
  Map<String, dynamic> toJson();
}

// Handler for the network's response.
abstract class Mapable {
  factory Mapable(Mapable type, String data) {
    if (type is BaseMapable) {
      Map<String, dynamic> mappingData = json.decode(data);
      return type.fromJson(mappingData);
    } else if (type is ListMapable) {
      List iterableData = json.decode(data);
      return type.fromJsonList(iterableData);
    }

    return Mapable(type, "");
  }
}

abstract class BaseMapable<T> implements Mapable {
  Mapable fromJson(Map<String, dynamic> json);
}

abstract class ListMapable<T> implements Mapable {
  Mapable fromJsonList(List<dynamic> json);
}

// Handler for the network's error response.
abstract class ErrorMapable implements BaseMapable {
  late String errorCode;
  late String description;
}
