class PostModel {
  int? id;
  String? title;
  String? body;
  int? userId;

  PostModel({this.id, this.title, this.body, this.userId});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
    );
  }
}
