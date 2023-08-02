// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itensusinas_relacao.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItensUsinasRelacao on _ItensUsinasRelacao, Store {
  late final _$idAtom = Atom(name: '_ItensUsinasRelacao.id', context: context);

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

  late final _$id_item_qtdAtom =
      Atom(name: '_ItensUsinasRelacao.id_item_qtd', context: context);

  @override
  String? get id_item_qtd {
    _$id_item_qtdAtom.reportRead();
    return super.id_item_qtd;
  }

  @override
  set id_item_qtd(String? value) {
    _$id_item_qtdAtom.reportWrite(value, super.id_item_qtd, () {
      super.id_item_qtd = value;
    });
  }

  late final _$id_usinaAtom =
      Atom(name: '_ItensUsinasRelacao.id_usina', context: context);

  @override
  int? get id_usina {
    _$id_usinaAtom.reportRead();
    return super.id_usina;
  }

  @override
  set id_usina(int? value) {
    _$id_usinaAtom.reportWrite(value, super.id_usina, () {
      super.id_usina = value;
    });
  }

  late final _$id_servicos_qtdAtom =
      Atom(name: '_ItensUsinasRelacao.id_servicos_qtd', context: context);

  @override
  String? get id_servicos_qtd {
    _$id_servicos_qtdAtom.reportRead();
    return super.id_servicos_qtd;
  }

  @override
  set id_servicos_qtd(String? value) {
    _$id_servicos_qtdAtom.reportWrite(value, super.id_servicos_qtd, () {
      super.id_servicos_qtd = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
id_item_qtd: ${id_item_qtd},
id_usina: ${id_usina},
id_servicos_qtd: ${id_servicos_qtd}
    ''';
  }
}
