//1. 창고 데이터(상태값)
import 'package:flutter_riverpod/flutter_riverpod.dart';

String data = "사과";

//2. 창고(상태 변경 메서드)
class FruitVM extends StateNotifier<String> {
  FruitVM(super.state);

  //stae를 바꿔야 리빌드가 된다.즉,상태가 변경된다.
  void changeData() {
    state = "딸기";
  }
}

//3. 창고 관리자(창고에 read/write 하게 해주는 친구)
// (창고이름, 창고상태)
// watch,read할때
final fruitProvider = StateNotifierProvider<FruitVM, String>((ref) {
  return FruitVM(data);
});
