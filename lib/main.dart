import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_01/fruit_store.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FruitPage(),
    );
  }
}

class FruitPage extends ConsumerWidget {
  const FruitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //창고의 데이터, 컨슈머 로직
    String data = ref.watch(fruitProvider);

    //창고, 퍼블리셔 로직
    FruitVM vm = ref.read(fruitProvider.notifier);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("data : ${data}", style: TextStyle(fontSize: 30)),
            ElevatedButton(
                onPressed: () {
                  // FruitVM vm = ref.read(fruitProvider.notifier);

                  vm.changeData();
                  print(vm.state);
                },
                child: Text("딸기상태로 변경"))
          ],
        ),
      ),
    );
  }
}
