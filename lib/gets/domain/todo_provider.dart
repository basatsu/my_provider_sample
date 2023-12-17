import 'package:flutter/material.dart';

import 'package:my_riverpod/gets/domain/todo.dart';

class TodoProvider with ChangeNotifier {
  final FetchTodoUseCase fetchTodoUseCase;
  Todo? todo;
  bool isLoading = true;

  TodoProvider(this.fetchTodoUseCase) {
    _fetchTodo();
  }

  Future<void> _fetchTodo() async {
    try {
      todo = await fetchTodoUseCase.execute();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      // handle error
    }
  }

  void updateTodoTitle(String newTitle) {
    if (todo != null) {
      todo!.title = newTitle;
      notifyListeners();
    }
  }
}
