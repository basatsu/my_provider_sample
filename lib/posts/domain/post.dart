import 'package:my_riverpod/posts/data/post_repository.dart';

class CreatePostUseCase {
  final PostRepository repository;

  CreatePostUseCase(this.repository);

  Future<Post> execute(String title, String body, int userId) async {
    final postModel = await repository.createPost(title, body, userId);
    return Post(
      id: postModel.id,
      title: postModel.title,
      body: postModel.body,
      userId: postModel.userId,
    );
  }
}

class Post {
  int? id;
  String? title;
  String? body;
  int? userId;

  Post({this.id, this.title, this.body, this.userId});
}
