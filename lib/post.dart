List<Post> listFromJson(dynamic data) {
  return List<Post>.from(data.map((e) => Post.fromJson(e))).toList();
}

class Post {
  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  Post.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  int? userId;
  int? id;
  String? title;
  String? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    return map;
  }
}
