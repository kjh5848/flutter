import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_01/todo.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(),
    );
  }
}

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //1. ref가 있어야 창고 관리자에게 접근이 가능하다.
    //2. read는 창고 데이터를 한번만 수신한다.
    TodoVM vm = ref.read(todoProvider);

    return Scaffold(
      body: Center(
        child: Text(
          "완료: ${vm.getCompleted()}, 내용 : ${vm.description}",
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("값변경"),
          onPressed: () {
            vm.isCompleted = false;

            print("완료, ${vm.isCompleted}");
          }),
    );
  }
}
