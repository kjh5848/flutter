import 'package:flutter_riverpod/flutter_riverpod.dart';

//창고데이터
class Todo {
  bool isCompleted;
  String description;
  Todo(this.isCompleted, this.description);
}

//창고 (vm)
//뿌려져 있던 데이터를 창고에 담고 관리자는 창고를 관리한다.
class TodoVM extends Todo {
  TodoVM(super.isCompleted, super.description);

  String getCompleted() {
    return isCompleted ? "완료" : "미완료";
  }
}

//창고관리자
final todoProvider = StateProvider<TodoVM>((ref) {
  return TodoVM(true, '공부하기');
});
