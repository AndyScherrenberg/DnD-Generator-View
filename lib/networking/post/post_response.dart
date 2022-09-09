import './../network_mappers.dart';

class PostList extends ListMapable {
  late List<PostResponse> posts;

  @override
  Mapable fromJsonList(List json) {
    posts = json.map((i) => PostResponse.fromJson(i)).toList();
    return this;
  }
}

class PostResponse {
  String userId;
  int id;
  String title;
  String body;

  PostResponse({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      userId: json['userId'].toString(),
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
