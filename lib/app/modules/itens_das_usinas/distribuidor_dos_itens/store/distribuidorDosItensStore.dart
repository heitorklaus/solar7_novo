import 'package:mobx/mobx.dart';

part 'distribuidorDosItensStore.g.dart';

class CategoriaDosItensStore = _CategoriaDosItensStoreBase
    with _$CategoriaDosItensStore;

abstract class _CategoriaDosItensStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
