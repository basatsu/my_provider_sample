import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TemperatureModel(),
      child: MyApp(),
    ),
  );
}

class TemperatureModel with ChangeNotifier {
  double _temperature = 23.0;

  double get temperature => _temperature;

  void increaseTemperature() {
    _temperature++;
    notifyListeners();
  }

  void decreaseTemperature() {
    _temperature--;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car AC Temperature Setting',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemperatureSettingScreen(),
    );
  }
}

class TemperatureSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<TemperatureModel>(
              builder: (context, model, child) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      iconSize: 38,
                      icon: Icon(Icons.arrow_left),
                      onPressed: model.decreaseTemperature,
                    ),
                    Text(
                      '${model.temperature}°',
                      style: TextStyle(fontSize: 50),
                    ),
                    IconButton(
                      iconSize: 38,
                      icon: Icon(Icons.arrow_right),
                      onPressed: model.increaseTemperature,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// import 'package:my_riverpod/gets/data/todo_repository.dart';
// import 'package:my_riverpod/gets/domain/todo.dart';
// import 'package:my_riverpod/gets/domain/todo_provider.dart';
// import 'package:my_riverpod/gets/presentation/pages/todopage.dart';
// import 'package:my_riverpod/posts/data/post_repository.dart';
// import 'package:my_riverpod/posts/domain/post.dart';
// import 'package:my_riverpod/posts/domain/post_provider.dart';
// //import 'package:my_riverpod/posts/presentation/post_screen.dart';

// import 'package:provider/provider.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//             create: (context) =>
//                 TodoProvider(FetchTodoUseCase(TodoRepository()))),
//         ChangeNotifierProvider(
//           create: (context) =>
//               PostProvider(CreatePostUseCase(PostRepository())),
//           child: MyApp(),
//         ),
//       ],
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Provider HTTP Example',
//       home: TodoScreen(),
//       //PostScreen(),
//     );
//   }
// }
