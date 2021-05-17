import 'package:mobx/mobx.dart';

part 'count.g.dart';

class CountStore = CountStoreMobx with _$CountStore;

abstract class CountStoreMobx with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void decrement() {
    value--;
  }

  @action
  void set(int value) {
    this.value = value;
  }
}
