import 'package:flutter/material.dart';
import 'package:my_riverpod/posts/domain/post_provider.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<PostProvider>(
              builder: (context, provider, child) {
                return Text(provider.post?.id.toString() ?? 'No title');
              },
            ),
            ElevatedButton(
              onPressed: () => context.read<PostProvider>().createPost(
                    'foo',
                    'bar',
                    1,
                  ),
              child: Text('Create Post'),
            ),
          ],
        ),
      ),
    );
  }
}
