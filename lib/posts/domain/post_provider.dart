import 'package:flutter/material.dart';
import 'package:my_riverpod/posts/domain/post.dart';

class PostProvider with ChangeNotifier {
  final CreatePostUseCase createPostUseCase;
  Post? post;

  PostProvider(this.createPostUseCase);

  Future<void> createPost(String title, String body, int userId) async {
    post = await createPostUseCase.execute(title, body, userId);
    notifyListeners();
  }
}
