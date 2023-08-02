import 'package:mobx/mobx.dart';
import 'package:solardino/app/shared/widgets/autocomplete/autocomplete_entitie.dart';

part 'autocomplete_store.g.dart';

// ignore: library_private_types_in_public_api
class AutocompleteStore = _AutocompleteStore with _$AutocompleteStore;

abstract class _AutocompleteStore with Store {
  @observable
  String newTodoTitle = "";

  @observable
  int? id;

  @observable
  double? valorDeCusto;

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;
  @action
  void setNewTodoId(int value) => id = value;
  @action
  void setNewTodoValorDeCusto(double value) => valorDeCusto = value;

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;

  ObservableList<AutoCompleteEntitie> todoList =
      ObservableList<AutoCompleteEntitie>();

  @action
  void addTodo() {
    todoList.add(AutoCompleteEntitie(
        item: newTodoTitle, qtd: 1, id: id, valor_de_custo: valorDeCusto));
    newTodoTitle = "";
  }

  @action
  void removeTodo(index) {
    todoList.removeAt(index);
  }

  @action
  void updateQtd(index, value) {
    //todoList.insert(index, TodoStore('teste', index));

    var v = value == "" ? 0 : value;

    todoList[index].qtd = int.parse(v);
  }
}
