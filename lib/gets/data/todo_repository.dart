import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_riverpod/gets/data/todo_model.dart';

class TodoRepository {
  Future<TodoModel> fetchTodo() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    if (response.statusCode == 200) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load todo');
    }
  }
}
