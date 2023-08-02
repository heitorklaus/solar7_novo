// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AutocompleteStore on _AutocompleteStore, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_AutocompleteStore.isFormValid'))
          .value;

  late final _$newTodoTitleAtom =
      Atom(name: '_AutocompleteStore.newTodoTitle', context: context);

  @override
  String get newTodoTitle {
    _$newTodoTitleAtom.reportRead();
    return super.newTodoTitle;
  }

  @override
  set newTodoTitle(String value) {
    _$newTodoTitleAtom.reportWrite(value, super.newTodoTitle, () {
      super.newTodoTitle = value;
    });
  }

  late final _$idAtom = Atom(name: '_AutocompleteStore.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$valorDeCustoAtom =
      Atom(name: '_AutocompleteStore.valorDeCusto', context: context);

  @override
  double? get valorDeCusto {
    _$valorDeCustoAtom.reportRead();
    return super.valorDeCusto;
  }

  @override
  set valorDeCusto(double? value) {
    _$valorDeCustoAtom.reportWrite(value, super.valorDeCusto, () {
      super.valorDeCusto = value;
    });
  }

  late final _$_AutocompleteStoreActionController =
      ActionController(name: '_AutocompleteStore', context: context);

  @override
  void setNewTodoTitle(String value) {
    final _$actionInfo = _$_AutocompleteStoreActionController.startAction(
        name: '_AutocompleteStore.setNewTodoTitle');
    try {
      return super.setNewTodoTitle(value);
    } finally {
      _$_AutocompleteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewTodoId(int value) {
    final _$actionInfo = _$_AutocompleteStoreActionController.startAction(
        name: '_AutocompleteStore.setNewTodoId');
    try {
      return super.setNewTodoId(value);
    } finally {
      _$_AutocompleteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewTodoValorDeCusto(double value) {
    final _$actionInfo = _$_AutocompleteStoreActionController.startAction(
        name: '_AutocompleteStore.setNewTodoValorDeCusto');
    try {
      return super.setNewTodoValorDeCusto(value);
    } finally {
      _$_AutocompleteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodo() {
    final _$actionInfo = _$_AutocompleteStoreActionController.startAction(
        name: '_AutocompleteStore.addTodo');
    try {
      return super.addTodo();
    } finally {
      _$_AutocompleteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(dynamic index) {
    final _$actionInfo = _$_AutocompleteStoreActionController.startAction(
        name: '_AutocompleteStore.removeTodo');
    try {
      return super.removeTodo(index);
    } finally {
      _$_AutocompleteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateQtd(dynamic index, dynamic value) {
    final _$actionInfo = _$_AutocompleteStoreActionController.startAction(
        name: '_AutocompleteStore.updateQtd');
    try {
      return super.updateQtd(index, value);
    } finally {
      _$_AutocompleteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newTodoTitle: ${newTodoTitle},
id: ${id},
valorDeCusto: ${valorDeCusto},
isFormValid: ${isFormValid}
    ''';
  }
}
