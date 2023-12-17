import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_riverpod/gets/domain/todo_provider.dart';
import 'package:my_riverpod/posts/domain/post_provider.dart';

import 'package:provider/provider.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer? _timer;

    void startTimer() {
      _timer?.cancel(); // 既存のタイマーをキャンセル
      _timer = Timer(Duration(seconds: 5), () {
        // 5秒経過後の処理
        context.read<PostProvider>().createPost('hoge', 'bar', 2);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Title'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final postProvider =
                  Provider.of<PostProvider>(context, listen: false);
              await postProvider.createPost(
                'foo',
                'bar',
                1,
              );
              Provider.of<TodoProvider>(context, listen: false)
                  .updateTodoTitle(postProvider.post?.id.toString() ?? '');
              //.updateTodoTitle(postProvider.post?.title ?? '');
            },
            child: const Text("POSTリクエスト"),
          ),
          Center(
            child: Consumer<TodoProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return CircularProgressIndicator();
                } else if (provider.todo != null) {
                  //POSTリクエストのボタンを押したら、レスポンス結果で取得したtitleの値で上書き。
                  return Text(provider.todo!.title ?? 'No title');
                } else {
                  return Text('Error');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
