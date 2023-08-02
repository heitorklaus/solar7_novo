// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$listaAtom = Atom(name: 'HomeStoreBase.lista', context: context);

  @override
  ObservableFuture<dynamic>? get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(ObservableFuture<dynamic>? value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
    });
  }

  late final _$listBuscaPotenciaAtom =
      Atom(name: 'HomeStoreBase.listBuscaPotencia', context: context);

  @override
  ObservableFuture<dynamic>? get listBuscaPotencia {
    _$listBuscaPotenciaAtom.reportRead();
    return super.listBuscaPotencia;
  }

  @override
  set listBuscaPotencia(ObservableFuture<dynamic>? value) {
    _$listBuscaPotenciaAtom.reportWrite(value, super.listBuscaPotencia, () {
      super.listBuscaPotencia = value;
    });
  }

  late final _$geracaoAtom =
      Atom(name: 'HomeStoreBase.geracao', context: context);

  @override
  ObservableFuture<dynamic>? get geracao {
    _$geracaoAtom.reportRead();
    return super.geracao;
  }

  @override
  set geracao(ObservableFuture<dynamic>? value) {
    _$geracaoAtom.reportWrite(value, super.geracao, () {
      super.geracao = value;
    });
  }

  late final _$moduloAtom =
      Atom(name: 'HomeStoreBase.modulo', context: context);

  @override
  String? get modulo {
    _$moduloAtom.reportRead();
    return super.modulo;
  }

  @override
  set modulo(String? value) {
    _$moduloAtom.reportWrite(value, super.modulo, () {
      super.modulo = value;
    });
  }

  late final _$changeModuloAsyncAction =
      AsyncAction('HomeStoreBase.changeModulo', context: context);

  @override
  Future<dynamic> changeModulo(dynamic x) {
    return _$changeModuloAsyncAction.run(() => super.changeModulo(x));
  }

  late final _$getListaAsyncAction =
      AsyncAction('HomeStoreBase.getLista', context: context);

  @override
  Future<dynamic> getLista(dynamic search) {
    return _$getListaAsyncAction.run(() => super.getLista(search));
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  dynamic getPotenciaNecessaria(dynamic search) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.getPotenciaNecessaria');
    try {
      return super.getPotenciaNecessaria(search);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lista: ${lista},
listBuscaPotencia: ${listBuscaPotencia},
geracao: ${geracao},
modulo: ${modulo}
    ''';
  }
}
