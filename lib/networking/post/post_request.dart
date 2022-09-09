import './../network_mappers.dart';

class PostRequest extends RequestMapable {
  final String userId;

  PostRequest(this.userId);

  @override
  Map<String, dynamic> toJson() => {
        'userId': userId,
      };
}
