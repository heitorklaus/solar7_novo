// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_entitie.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AutoCompleteEntitie on _AutoCompleteEntitie, Store {
  late final _$itemAtom =
      Atom(name: '_AutoCompleteEntitie.item', context: context);

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

  late final _$idAtom = Atom(name: '_AutoCompleteEntitie.id', context: context);

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

  late final _$qtdAtom =
      Atom(name: '_AutoCompleteEntitie.qtd', context: context);

  @override
  dynamic get qtd {
    _$qtdAtom.reportRead();
    return super.qtd;
  }

  @override
  set qtd(dynamic value) {
    _$qtdAtom.reportWrite(value, super.qtd, () {
      super.qtd = value;
    });
  }

  late final _$potenciaAtom =
      Atom(name: '_AutoCompleteEntitie.potencia', context: context);

  @override
  double? get potencia {
    _$potenciaAtom.reportRead();
    return super.potencia;
  }

  @override
  set potencia(double? value) {
    _$potenciaAtom.reportWrite(value, super.potencia, () {
      super.potencia = value;
    });
  }

  late final _$valor_de_custoAtom =
      Atom(name: '_AutoCompleteEntitie.valor_de_custo', context: context);

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

  late final _$valor_de_vendaAtom =
      Atom(name: '_AutoCompleteEntitie.valor_de_venda', context: context);

  @override
  double? get valor_de_venda {
    _$valor_de_vendaAtom.reportRead();
    return super.valor_de_venda;
  }

  @override
  set valor_de_venda(double? value) {
    _$valor_de_vendaAtom.reportWrite(value, super.valor_de_venda, () {
      super.valor_de_venda = value;
    });
  }

  late final _$categoriaAtom =
      Atom(name: '_AutoCompleteEntitie.categoria', context: context);

  @override
  String? get categoria {
    _$categoriaAtom.reportRead();
    return super.categoria;
  }

  @override
  set categoria(String? value) {
    _$categoriaAtom.reportWrite(value, super.categoria, () {
      super.categoria = value;
    });
  }

  @override
  String toString() {
    return '''
item: ${item},
id: ${id},
qtd: ${qtd},
potencia: ${potencia},
valor_de_custo: ${valor_de_custo},
valor_de_venda: ${valor_de_venda},
categoria: ${categoria}
    ''';
  }
}
