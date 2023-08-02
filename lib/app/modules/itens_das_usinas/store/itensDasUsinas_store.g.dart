// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itensDasUsinas_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItensDasUsinasStore on _ItensDasUsinasStoreBase, Store {
  late final _$searchAtom =
      Atom(name: '_ItensDasUsinasStoreBase.search', context: context);

  @override
  TextEditingController get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(TextEditingController value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$listaDeItensAtom =
      Atom(name: '_ItensDasUsinasStoreBase.listaDeItens', context: context);

  @override
  ObservableFuture<dynamic>? get listaDeItens {
    _$listaDeItensAtom.reportRead();
    return super.listaDeItens;
  }

  @override
  set listaDeItens(ObservableFuture<dynamic>? value) {
    _$listaDeItensAtom.reportWrite(value, super.listaDeItens, () {
      super.listaDeItens = value;
    });
  }

  late final _$tipoDeModuloControllerAtom = Atom(
      name: '_ItensDasUsinasStoreBase.tipoDeModuloController',
      context: context);

  @override
  TextEditingController get tipoDeModuloController {
    _$tipoDeModuloControllerAtom.reportRead();
    return super.tipoDeModuloController;
  }

  @override
  set tipoDeModuloController(TextEditingController value) {
    _$tipoDeModuloControllerAtom
        .reportWrite(value, super.tipoDeModuloController, () {
      super.tipoDeModuloController = value;
    });
  }

  late final _$tipoDeInversorControllerAtom = Atom(
      name: '_ItensDasUsinasStoreBase.tipoDeInversorController',
      context: context);

  @override
  TextEditingController get tipoDeInversorController {
    _$tipoDeInversorControllerAtom.reportRead();
    return super.tipoDeInversorController;
  }

  @override
  set tipoDeInversorController(TextEditingController value) {
    _$tipoDeInversorControllerAtom
        .reportWrite(value, super.tipoDeInversorController, () {
      super.tipoDeInversorController = value;
    });
  }

  late final _$listaDeItensBuscadosAtom = Atom(
      name: '_ItensDasUsinasStoreBase.listaDeItensBuscados', context: context);

  @override
  ObservableFuture<dynamic>? get listaDeItensBuscados {
    _$listaDeItensBuscadosAtom.reportRead();
    return super.listaDeItensBuscados;
  }

  @override
  set listaDeItensBuscados(ObservableFuture<dynamic>? value) {
    _$listaDeItensBuscadosAtom.reportWrite(value, super.listaDeItensBuscados,
        () {
      super.listaDeItensBuscados = value;
    });
  }

  late final _$listaDeServicosBuscadosAtom = Atom(
      name: '_ItensDasUsinasStoreBase.listaDeServicosBuscados',
      context: context);

  @override
  ObservableFuture<dynamic>? get listaDeServicosBuscados {
    _$listaDeServicosBuscadosAtom.reportRead();
    return super.listaDeServicosBuscados;
  }

  @override
  set listaDeServicosBuscados(ObservableFuture<dynamic>? value) {
    _$listaDeServicosBuscadosAtom
        .reportWrite(value, super.listaDeServicosBuscados, () {
      super.listaDeServicosBuscados = value;
    });
  }

  @override
  String toString() {
    return '''
search: ${search},
listaDeItens: ${listaDeItens},
tipoDeModuloController: ${tipoDeModuloController},
tipoDeInversorController: ${tipoDeInversorController},
listaDeItensBuscados: ${listaDeItensBuscados},
listaDeServicosBuscados: ${listaDeServicosBuscados}
    ''';
  }
}
