import 'package:my_riverpod/gets/data/todo_repository.dart';

class FetchTodoUseCase {
  final TodoRepository repository;

  FetchTodoUseCase(this.repository);

  Future<Todo> execute() async {
    final todoModel = await repository.fetchTodo();
    return Todo(
      userId: todoModel.userId,
      id: todoModel.id,
      title: todoModel.title,
      completed: todoModel.completed,
    );
  }
}

class Todo {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Todo({this.userId, this.id, this.title, this.completed});
}
