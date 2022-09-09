import './../network_mappers.dart';

class ErrorResponse implements ErrorMapable, BaseMapable {
  @override
  late String description;

  @override
  late String errorCode;

  @override
  Mapable fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    description = json['description'];

    return this;
  }
}
