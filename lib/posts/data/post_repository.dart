import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_riverpod/posts/data/post_model.dart';

class PostRepository {
  Future<PostModel> createPost(String title, String body, int userId) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: json.encode({'title': title, 'body': body, 'userId': userId}),
    );
    if (response.statusCode == 201) {
      return PostModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create post');
    }
  }
}
