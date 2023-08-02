// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_relacionado.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItenRelacionado on _ItenRelacionado, Store {
  late final _$idAtom = Atom(name: '_ItenRelacionado.id', context: context);

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

  late final _$itemAtom = Atom(name: '_ItenRelacionado.item', context: context);

  @override
  String? get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(String? value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  late final _$qtdAtom = Atom(name: '_ItenRelacionado.qtd', context: context);

  @override
  String? get qtd {
    _$qtdAtom.reportRead();
    return super.qtd;
  }

  @override
  set qtd(String? value) {
    _$qtdAtom.reportWrite(value, super.qtd, () {
      super.qtd = value;
    });
  }

  late final _$valor_de_custoAtom =
      Atom(name: '_ItenRelacionado.valor_de_custo', context: context);

  @override
  double? get valor_de_custo {
    _$valor_de_custoAtom.reportRead();
    return super.valor_de_custo;
  }

  @override
  set valor_de_custo(double? value) {
    _$valor_de_custoAtom.reportWrite(value, super.valor_de_custo, () {
      super.valor_de_custo = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
item: ${item},
qtd: ${qtd},
valor_de_custo: ${valor_de_custo}
    ''';
  }
}
